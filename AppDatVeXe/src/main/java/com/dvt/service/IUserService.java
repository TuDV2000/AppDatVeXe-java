package com.dvt.service;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;

import java.util.List;

public interface IUserService extends IGenericsServevice<User> {
    boolean createUser(User user);
}
