package com.kachur.controller;

import com.kachur.model.Appointment;
import com.kachur.model.Patient;
import com.kachur.service.AppointmentService;
import com.kachur.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;



@Controller
public class PatientHistoryController {

    @Autowired
    private  AppointmentService appointmentService;

    @Autowired
    private PatientService patientService;

//    @RequestMapping(value = "/patienthistory/{id}", method = RequestMethod.GET)
//    public String getPatientHistory(Model model, @PathVariable("id") Long id) {
//        List<Appointment> appointments = appointmentService.appointmentsOfUserEnded(id);
//        model.addAttribute("endedAppointments", appointments);
//        return "patientHistoryPage";
//    }

    @RequestMapping(value = "/patienthistory/{id}", method = RequestMethod.GET)
    public String getPatientHistory(Model model, @PathVariable("id") Long id) {
        List<Appointment> appointments = appointmentService.appointmentsOfUserEnded(id);
        Patient patient = patientService.findById(id);
        model.addAttribute("patient", patient);
        model.addAttribute("endedAppointments", appointments);
        return "patientHistoryPage";
    }

//    @RequestMapping(value = "/patienthistory/{id}", method = RequestMethod.POST)
//    public String getPatientHistory(Model model, HttpServletRequest request, @PathVariable("id") Long id) {
//        List<Appointment> appointments = appointmentService.appointmentsOfUserEnded(id);
//        model.addAttribute("endedAppointments", appointments);
//        return "patientHistoryPage";
//    }

}
