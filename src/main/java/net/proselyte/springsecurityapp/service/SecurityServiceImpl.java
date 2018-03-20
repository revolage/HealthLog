package net.proselyte.springsecurityapp.service;

import net.proselyte.springsecurityapp.auth.CustomAuthToken;
import net.proselyte.springsecurityapp.auth.UserDetailsServiceImpl;
import net.proselyte.springsecurityapp.auth.UserType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

/**
 * Inplementation of {@link SecurityService} interface
 */

@Service
public class SecurityServiceImpl implements SecurityService {
    private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Override
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails) userDetails).getUsername();
        }
        return null;
    }

    @Override
    public void autoLogin(String username, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsernameAndDomain(username, UserType.PATIENT);
        UsernamePasswordAuthenticationToken authenticationToken =
                new CustomAuthToken(userDetails, password, UserType.PATIENT);
        authenticationManager.authenticate(authenticationToken);

        if (authenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(authenticationToken);
            logger.debug(String.format("Successfully %s auto logged in ", username));
        }


    }
}
