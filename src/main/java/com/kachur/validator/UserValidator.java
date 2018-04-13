package com.kachur.validator;

import com.kachur.model.Patient;
import com.kachur.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * Validator for {@link Patient} class,
 * inplements {@link Validator} interface.
 */

@Component
public class UserValidator implements Validator {
    @Autowired
    private PatientService patientService;

    @Override
    public boolean supports(Class<?> aClass) {
        return Patient.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Patient patient = (Patient) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "Required");
        if (patient.getEmail().length() < 6 || patient.getEmail().length() > 32) {

            errors.rejectValue("email", "Size.registrationForm.username");
        }

        if (patientService.findByEmail(patient.getEmail()) != null) {
            errors.rejectValue("email", "Duplicate.registrationForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Required");
        if (patient.getPassword().length() < 8 || patient.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.registrationForm.password");
        }
        if (!patient.getConfirmPassword().equals(patient.getPassword())) {
            errors.rejectValue("confirmPassword", "Different.registrationForm.password");
        }

    }
}
