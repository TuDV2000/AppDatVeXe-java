package com.dvt.repository;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;

import java.util.List;

public interface IUserRepository extends IGenericsRepository<User> {
    boolean createUser(User user);
    boolean updateUser(User user);
    public User getUserByUsername(String username);
}
