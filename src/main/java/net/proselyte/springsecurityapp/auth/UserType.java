package net.proselyte.springsecurityapp.auth;

public enum UserType {
    DOCTOR,
    PATIENT;

    public static final String USER_TYPE_PARAM = "userType";
}
