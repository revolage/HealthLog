package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.auth.CustomAuthToken;
import net.proselyte.springsecurityapp.auth.UserType;
import net.proselyte.springsecurityapp.model.Appointment;
import net.proselyte.springsecurityapp.model.Doctor;
import net.proselyte.springsecurityapp.model.Patient;
import net.proselyte.springsecurityapp.service.AppointmentService;
import net.proselyte.springsecurityapp.service.DoctorService;
import net.proselyte.springsecurityapp.service.SecurityService;
import net.proselyte.springsecurityapp.service.PatientService;
import net.proselyte.springsecurityapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
    private SecurityService securityService;

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
        //todo : Add UserType for registration
//        securityService.autoLogin(patientForm.getUsername(), patientForm.getConfirmPassword());
        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect");
        }
        if (logout != null) {
            model.addAttribute("message", "Logged out successfully");
        }
        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        CustomAuthToken auth = (CustomAuthToken) SecurityContextHolder.getContext().getAuthentication();
        String loggedInUsername = auth.getName();
        UserType userType = auth.getUserType();
        if (UserType.PATIENT == userType) {
            Patient patient = patientService.findByUsername(loggedInUsername);
            model.addAttribute("patient", patient); //patient
            //Appointment appointment = appointmentService.findAppointmentById(patient.getId());
            //model.addAttribute("appointment", appointment);
            List<Doctor> doctorList = doctorService.findAllDoctors();
            model.addAttribute("doctorList", doctorList);
            List<Appointment> appointmentListPlaned = appointmentService.appointmentsOfUserPlaned(patient.getId());
            model.addAttribute("appointmentListPlaned", appointmentListPlaned);
            List<Appointment> appointmentListEnded = appointmentService.appointmentsOfUserEnded(patient.getId());
            model.addAttribute("appointmentListEnded", appointmentListEnded);
            model.addAttribute("emptyAppointment", new Appointment());
        } else if (UserType.DOCTOR == userType) {
            Doctor doctor = doctorService.findDoctorByName(loggedInUsername);
            model.addAttribute("doctor", doctor);
            List<Appointment> appointmentListPlaned = appointmentService.appointmentsOfDoctorPlanedSorted(doctor.getId());
            model.addAttribute("appointmentListPlaned", appointmentListPlaned);
            model.addAttribute("appointment", new Appointment());
        }
        return UserType.PATIENT == userType ? "welcome" : "doctorPage";
    }
}
