package com.kachur.controller;

import com.kachur.auth.CustomAuthToken;
import com.kachur.model.Appointment;
import com.kachur.service.AppointmentService;
import com.kachur.service.DoctorService;
import com.kachur.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PatientService patientService;

    public static String decodeParameter(String parameter) throws UnsupportedEncodingException {
        return new String(parameter.getBytes("ISO-8859-1"),"UTF8");
    }

    @RequestMapping(value = "/appointment", method = RequestMethod.POST)
    public String registration(HttpServletRequest request) throws ParseException, UnsupportedEncodingException {

        CustomAuthToken auth = (CustomAuthToken) SecurityContextHolder.getContext().getAuthentication();
        String loggedInUsername = auth.getName();

        Appointment appointment = new Appointment();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(request.getParameter("date"));
        appointment.setDate(date);

        appointment.setPatient(patientService.findByUsername(loggedInUsername));

        appointment.setSymptoms(decodeParameter(request.getParameter("symptoms")));

        Long doctorId = Long.parseLong(request.getParameter("doctorId"));
        appointment.setDoctor(doctorService.findDoctorById(doctorId));
        //appointment.setIsVisited(false);
        appointment.setIsCanceled(false);
        appointment.setIsVisited(false);

        appointmentService.createAppointment(appointment);
//        Doctor doctor = new Doctor();
//        doctor.setId(1L);
//            Date date = new Date();
//        appointment.setDate(date);

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/appointment/{id}", method = RequestMethod.POST)
    public String updateAppointment(HttpServletRequest request, @PathVariable("id") Long id) throws UnsupportedEncodingException {
        Appointment appointment = appointmentService.findAppointmentById(id);
        String diagnosis = decodeParameter(request.getParameter("diagnosis"));
        String medication = decodeParameter(request.getParameter("medication"));
        String notes = decodeParameter(request.getParameter("notes"));

        appointment.setDiagnosis(diagnosis);
        appointment.setMedication(medication);
        appointment.setNotes(notes);
        appointment.setIsVisited(true);
        Appointment updatedAppointment = appointmentService.updateAppointment(appointment);


        //request.setCharacterEncoding("utf-8");
        //String diagnosis = new String(request.getParameter("diagnosis").getBytes(),"utf-8");
        //String diagnosis = new String(decodeParameter(request.getParameter("diagnosis")));
        //String sdd= new String(.getBytes(),"utf-8");
        //String sdfsdf = new String(decodeParameter(request.getParameter("diagnosis")));
        return "redirect:/welcome";
    }


}
