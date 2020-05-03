package com.tsf.database.repositories;

import java.util.ArrayList;

public interface Repository<T> {
    public ArrayList<T> findAll();
    public void create(T entity);
    public void update(T entity);
    public void delete(T entity);
    //public T findOne(T entity);
}
