package com.dvt.service;

import java.util.List;

public interface IGenericsServevice<T> {
    List<T> getAll();
    void save(T obj);
    void update(T obj);
    void saveOrUpdate(T obj);
    void delete(T obj);
}
