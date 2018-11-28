package com.epam.javatraining.spring.web.dao;

import java.util.List;

public interface BasicDao<E, K> {

    K insert(E entity);

    int update(E entity);

    K save(E entity);

    void delete(E entity);

    void deleteById(K id);

    E findOne(E entity);

    E findOneById(K id);

    List<E> findAll();

    List<E> findAll(long offset, long count);

    K count();

}
