/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import BusinessClasses.exceptions.IllegalOrphanException;
import BusinessClasses.exceptions.NonexistentEntityException;
import BusinessClasses.exceptions.PreexistingEntityException;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Entities.Account;
import Entities.Orders;
import Entities.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

/**
 *
 * @author 775224
 */
public class UserJpaController implements Serializable {

    public void create(User user) throws PreexistingEntityException, Exception {
        if (user.getOrdersCollection() == null) {
            user.setOrdersCollection(new ArrayList<Orders>());
        }
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            Account accountNo = user.getAccountNo();
            if (accountNo != null) {
                accountNo = em.getReference(accountNo.getClass(), accountNo.getAccountNo());
                user.setAccountNo(accountNo);
            }
            Collection<Orders> attachedOrdersCollection = new ArrayList<Orders>();
            for (Orders ordersCollectionOrdersToAttach : user.getOrdersCollection()) {
                ordersCollectionOrdersToAttach = em.getReference(ordersCollectionOrdersToAttach.getClass(), ordersCollectionOrdersToAttach.getOrderNo());
                attachedOrdersCollection.add(ordersCollectionOrdersToAttach);
            }
            user.setOrdersCollection(attachedOrdersCollection);
            em.persist(user);
            if (accountNo != null) {
                accountNo.getUserCollection().add(user);
                accountNo = em.merge(accountNo);
            }
            for (Orders ordersCollectionOrders : user.getOrdersCollection()) {
                User oldUserIdOfOrdersCollectionOrders = ordersCollectionOrders.getUserId();
                ordersCollectionOrders.setUserId(user);
                ordersCollectionOrders = em.merge(ordersCollectionOrders);
                if (oldUserIdOfOrdersCollectionOrders != null) {
                    oldUserIdOfOrdersCollectionOrders.getOrdersCollection().remove(ordersCollectionOrders);
                    oldUserIdOfOrdersCollectionOrders = em.merge(oldUserIdOfOrdersCollectionOrders);
                }
            }
            trans.commit();
        } catch (Exception ex) {
            if (findUser(user.getUserId()) != null) {
                throw new PreexistingEntityException("User " + user + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(User user) throws IllegalOrphanException, NonexistentEntityException, Exception {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            User persistentUser = em.find(User.class, user.getUserId());
            Account accountNoOld = persistentUser.getAccountNo();
            Account accountNoNew = user.getAccountNo();
            Collection<Orders> ordersCollectionOld = persistentUser.getOrdersCollection();
            Collection<Orders> ordersCollectionNew = user.getOrdersCollection();
            List<String> illegalOrphanMessages = null;
            for (Orders ordersCollectionOldOrders : ordersCollectionOld) {
                if (!ordersCollectionNew.contains(ordersCollectionOldOrders)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Orders " + ordersCollectionOldOrders + " since its userId field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (accountNoNew != null) {
                accountNoNew = em.getReference(accountNoNew.getClass(), accountNoNew.getAccountNo());
                user.setAccountNo(accountNoNew);
            }
            Collection<Orders> attachedOrdersCollectionNew = new ArrayList<Orders>();
            for (Orders ordersCollectionNewOrdersToAttach : ordersCollectionNew) {
                ordersCollectionNewOrdersToAttach = em.getReference(ordersCollectionNewOrdersToAttach.getClass(), ordersCollectionNewOrdersToAttach.getOrderNo());
                attachedOrdersCollectionNew.add(ordersCollectionNewOrdersToAttach);
            }
            ordersCollectionNew = attachedOrdersCollectionNew;
            user.setOrdersCollection(ordersCollectionNew);
            user = em.merge(user);
            if (accountNoOld != null && !accountNoOld.equals(accountNoNew)) {
                accountNoOld.getUserCollection().remove(user);
                accountNoOld = em.merge(accountNoOld);
            }
            if (accountNoNew != null && !accountNoNew.equals(accountNoOld)) {
                accountNoNew.getUserCollection().add(user);
                accountNoNew = em.merge(accountNoNew);
            }
            for (Orders ordersCollectionNewOrders : ordersCollectionNew) {
                if (!ordersCollectionOld.contains(ordersCollectionNewOrders)) {
                    User oldUserIdOfOrdersCollectionNewOrders = ordersCollectionNewOrders.getUserId();
                    ordersCollectionNewOrders.setUserId(user);
                    ordersCollectionNewOrders = em.merge(ordersCollectionNewOrders);
                    if (oldUserIdOfOrdersCollectionNewOrders != null && !oldUserIdOfOrdersCollectionNewOrders.equals(user)) {
                        oldUserIdOfOrdersCollectionNewOrders.getOrdersCollection().remove(ordersCollectionNewOrders);
                        oldUserIdOfOrdersCollectionNewOrders = em.merge(oldUserIdOfOrdersCollectionNewOrders);
                    }
                }
            }
            trans.commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = user.getUserId();
                if (findUser(id) == null) {
                    throw new NonexistentEntityException("The user with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            User user;
            try {
                user = em.getReference(User.class, id);
                user.getUserId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The user with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Collection<Orders> ordersCollectionOrphanCheck = user.getOrdersCollection();
            for (Orders ordersCollectionOrphanCheckOrders : ordersCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This User (" + user + ") cannot be destroyed since the Orders " + ordersCollectionOrphanCheckOrders + " in its ordersCollection field has a non-nullable userId field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Account accountNo = user.getAccountNo();
            if (accountNo != null) {
                accountNo.getUserCollection().remove(user);
                accountNo = em.merge(accountNo);
            }
            em.remove(user);
            trans.commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<User> findUserEntities() {
        return findUserEntities(true, -1, -1);
    }

    public List<User> findUserEntities(int maxResults, int firstResult) {
        return findUserEntities(false, maxResults, firstResult);
    }

    private List<User> findUserEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(User.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public User findUser(Integer id) {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }

    public int getUserCount() {
        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<User> rt = cq.from(User.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
