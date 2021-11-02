package com.dvt.repository.implement;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.repository.IUserRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

@Repository
@Transactional
public class UserRepository extends GenericsRepository<User> implements IUserRepository {

    @Override
    public boolean createUser(User user) {
        if (user != null) {
            user.setActive(true);
            getCurrentSession().save(user);

            return true;
        }
        return false;
    }

    @Override
    public User getUserByUsername(String username) {
        return (User) getCurrentSession().createQuery("from User where username = :un")
                .setParameter("un", username).getSingleResult();
    }

//    public List<User> getUsers(String username) {
//        String hql = "from User where username = :un";
//        List<User> users = getCurrentSession().createQuery(hql)
//                .setParameter("un", username).getResultList();
//    }
}
