package net.proselyte.springsecurityapp.service;

/**
 * Service for Security
 */
public interface SecurityService {
    String findLoggedInUsername();

    //todo: add userType from form
    void autoLogin(String email, String password);
}
