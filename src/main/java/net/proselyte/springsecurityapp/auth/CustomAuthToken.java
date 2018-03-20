package net.proselyte.springsecurityapp.auth;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class CustomAuthToken extends UsernamePasswordAuthenticationToken {

    private UserType userType;

    public CustomAuthToken(Object principal, Object credentials, UserType userType) {
        super(principal, credentials);
        this.userType = userType;
    }

    public CustomAuthToken(Object principal, Object credentials, Collection<? extends GrantedAuthority> authorities, UserType userType) {
        super(principal, credentials, authorities);
        this.userType = userType;
    }

    public UserType getUserType() {
        return userType;
    }
}
