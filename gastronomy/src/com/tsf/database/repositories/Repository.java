package com.tsf.database.repositories;

import java.util.ArrayList;

public interface Repository<T> {
    public ArrayList<T> findAll();
    public T findOne(String key);
    public void create(T entity);
    public void update(T entity);
    //String getInsert();
}
