package net.proselyte.springsecurityapp.auth.filter;

import net.proselyte.springsecurityapp.auth.CustomAuthToken;
import net.proselyte.springsecurityapp.auth.UserType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

public class UserLoginFilter extends UsernamePasswordAuthenticationFilter {

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response)
            throws AuthenticationException {
        UsernamePasswordAuthenticationToken authRequest = getAuthRequest(request);

        setDetails(request, authRequest);

        return this.getAuthenticationManager().authenticate(authRequest);
    }

    private UsernamePasswordAuthenticationToken getAuthRequest(
            HttpServletRequest request) {

        String username = obtainUsername(request);
        String password = obtainPassword(request);
        UserType userType = obtainUserType(request);
        return new CustomAuthToken(username, password, userType);
    }

    private UserType obtainUserType(HttpServletRequest request) {
        String userTypeParam = Optional.ofNullable(request.getParameter(UserType.USER_TYPE_PARAM))
                .orElseThrow(() -> new UsernameNotFoundException("User type should be selected"));
        return UserType.valueOf(userTypeParam);
    }

    @Override
    @Autowired
    public void setAuthenticationManager(AuthenticationManager authenticationManager) {
        super.setAuthenticationManager(authenticationManager);
    }
}
