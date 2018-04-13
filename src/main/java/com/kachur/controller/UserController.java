package com.kachur.controller;

import com.kachur.auth.CustomAuthToken;
import com.kachur.auth.UserType;
import com.kachur.model.Appointment;
import com.kachur.model.Doctor;
import com.kachur.model.Patient;
import com.kachur.service.AppointmentService;
import com.kachur.service.DoctorService;
import com.kachur.service.PatientService;
import com.kachur.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Controller for {@link Patient}`s pages.
 */
@Controller
public class UserController {
    @Autowired
    private PatientService patientService;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private DoctorService doctorService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("registrationForm", new Patient());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("registrationForm") Patient patientForm, BindingResult bindingResult, Model model) {
        userValidator.validate(patientForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registration";
        }
        patientService.save(patientForm);
        return "redirect:/login?registered";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout, String registered) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully");
        }
        if (registered != null) {
            model.addAttribute("message", "Login with new account");
        }
        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        CustomAuthToken auth = (CustomAuthToken) SecurityContextHolder.getContext().getAuthentication();
        String loggedInUsername = auth.getName();
        UserType userType = auth.getUserType();
        if (UserType.PATIENT == userType) {
            Patient patient = patientService.findByEmail(loggedInUsername);
            model.addAttribute("patient", patient);
            List<Doctor> doctorList = doctorService.findAllDoctors();
            model.addAttribute("doctorList", doctorList);
            List<Appointment> appointmentListPlaned = appointmentService.appointmentsOfUserPlaned(patient.getId());
            model.addAttribute("appointmentListPlaned", appointmentListPlaned);
            List<Appointment> appointmentListEnded = appointmentService.appointmentsOfUserEnded(patient.getId());
            model.addAttribute("appointmentListEnded", appointmentListEnded);
            model.addAttribute("emptyAppointment", new Appointment());
        } else if (UserType.DOCTOR == userType) {
            Doctor doctor = doctorService.findDoctorByEmail(loggedInUsername);
            model.addAttribute("doctor", doctor);
            List<Appointment> appointmentListPlaned = appointmentService.appointmentsOfDoctorPlanedSorted(doctor.getId());
            model.addAttribute("appointmentListPlaned", appointmentListPlaned);
            model.addAttribute("appointment", new Appointment());
        }
        return UserType.PATIENT == userType ? "welcome" : "doctorPage";
    }
}
