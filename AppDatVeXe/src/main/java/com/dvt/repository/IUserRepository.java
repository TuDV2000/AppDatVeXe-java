package com.dvt.repository;

import com.dvt.pojos.Permission;
import com.dvt.pojos.Ticket;
import com.dvt.pojos.Trip;
import com.dvt.pojos.User;

import java.util.List;

public interface IUserRepository extends IGenericsRepository<User> {
    boolean createUser(User user);
    boolean updateUser(User user);
    public User getUserByUsername(String username);
    public List<Ticket> getTicketByUsername (String username);
    public void updateAvatar(String username, String avatar);
}
