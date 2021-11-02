package com.dvt.service.implement;

import com.dvt.pojos.Permission;
import com.dvt.pojos.User;
import com.dvt.repository.IUserRepository;
import com.dvt.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashSet;
import java.util.Set;

@Service("userDetailsService")
@Transactional
public class UserService extends GenericsService<User> implements IUserService {
    @Autowired
    IUserRepository userRepository;

    @Override
    public boolean createUser(User user) {
        return userRepository.createUser(user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.getUserByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.getUserByUsername(username);

        if (user == null)
            throw new UsernameNotFoundException("Không tồn tại");
        Set<GrantedAuthority> authoritySet = new HashSet<>();
        for (Permission p: user.getPermissions()) {
            authoritySet.add(new SimpleGrantedAuthority(p.getName()));
        }

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authoritySet);
    }
}
