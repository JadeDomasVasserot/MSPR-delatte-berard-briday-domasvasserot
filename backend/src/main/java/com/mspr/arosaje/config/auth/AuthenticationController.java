package com.mspr.arosaje.config.auth;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;

@RestController
@SecurityRequirement(name = "portal")
@Tag(name = "Authentication")
@RequestMapping("/auth")
public class AuthenticationController {

    @Autowired
    private AuthenticationService service;

    @PostMapping("/register")
    @Operation(summary = "permet à un utilisateur de s'enregistrer")
    public ResponseEntity<AuthenticationResponse> register(
            @RequestBody RegisterRequest request
    ) {
        try {
            return new ResponseEntity<AuthenticationResponse>(service.register(request), HttpStatus.OK);
        } catch (final HttpClientErrorException e) {
            System.err.println(e.getStatusCode());
            System.err.println(e.getResponseBodyAsString());
            return new ResponseEntity<>(
                    e.getStatusCode());
        }
    }

    @PostMapping("/authenticate")
    @Operation(summary = "permet à un utilisateur de se connecter")
    public ResponseEntity<AuthenticationResponse> authenticate(
            @RequestBody AuthenticationRequest request) {
        try {
            return new ResponseEntity<AuthenticationResponse>(service.authenticate(request), HttpStatus.OK);
        } catch (final HttpClientErrorException e) {
            System.err.println(e.getStatusCode());
            System.err.println(e.getResponseBodyAsString());
            return new ResponseEntity<>(
                    e.getStatusCode());
        }
    }

}
