package com.msmaitran.onelineaday.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class UnauthorizedUserException extends AuthenticationException {

    public UnauthorizedUserException(String message) {
        super(message);
    }

    public UnauthorizedUserException(String message,
                                     Throwable cause) {
        super(message, cause);
    }
}
