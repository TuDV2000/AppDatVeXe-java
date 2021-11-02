package com.dvt.service;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends IGenericsServevice<User>, UserDetailsService {
    boolean createUser(User user);
    public User getUserByUsername(String username);
}
