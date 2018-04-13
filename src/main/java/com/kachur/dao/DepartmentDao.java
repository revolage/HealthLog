package com.kachur.dao;

import com.kachur.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDao extends JpaRepository<Department, Long> {
    List<Department> findAll();
}
