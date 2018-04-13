package com.kachur.service;

import com.kachur.dao.DepartmentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentDao departmentDao;
    @Override
    public void testDepartment() {
        departmentDao.findAll();
    }
}
