package com.dvt.service.implement;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.repository.IUserRepository;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

@Service
@Transactional
public class UserService extends GenericsService<User> implements IUserService {
    @Autowired
    IUserRepository userRepository;

    @Override
    public boolean createUser(User user) {
        return userRepository.createUser(user);
    }
}
