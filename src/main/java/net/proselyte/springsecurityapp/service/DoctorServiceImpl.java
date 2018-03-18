package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.dao.DoctorDao;
import net.proselyte.springsecurityapp.model.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService{

    @Autowired
    private DoctorDao doctorDao;

    @Override
    public Doctor findDoctorById(Long id) {
        return doctorDao.findById(id);
    }

    @Override
    public List<Doctor> findAllDoctors() {
        return doctorDao.findAll();
    }
}
