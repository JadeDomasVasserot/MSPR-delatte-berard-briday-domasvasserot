package com.mspr.arosaje.config.auth;

import com.mspr.arosaje.config.config.JwtService;
import com.mspr.arosaje.models.PersonneModel;
import com.mspr.arosaje.repositories.PersonneRepository;
import com.mspr.arosaje.repositories.RoleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;


@Service
@RequiredArgsConstructor
public class AuthenticationService {
    private final PersonneRepository personneRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;
    private final RoleRepository roleRepository;
    private PersonneModel currentUser;
    private String jwtToken;

    public String getJwtToken() {
        return jwtToken;
    }

    public void setJwtToken(String jwtToken) {
        jwtToken = jwtToken;
    }

    public PersonneModel getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(PersonneModel currentUser) {
        this.currentUser = currentUser;
    }

    public AuthenticationResponse register(RegisterRequest request) {
        Date date = new Date();
        PersonneModel user = PersonneModel.builder()
                .nom(request.getLastname())
                .prenom(request.getFirstname())
                .email(request.getEmail())
                .mdp(passwordEncoder.encode(request.getPassword()))
                .cp(request.getCp())
                .ville((request.getVille()))
                .adresse(request.getAdresse())
                .role(roleRepository.findById(1).get())
                .build();
        personneRepository.save(user);
        var jwtToken = jwtService.generateToken(user);
        return AuthenticationResponse.builder()
                .token(jwtToken)
                .build();
    }

    public AuthenticationResponse authenticate(AuthenticationRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail(),
                        request.getPassword()
                )
        );
        PersonneModel user = personneRepository.getByEmail(request.getEmail())
                .orElseThrow();
        if (new BCryptPasswordEncoder().matches(request.getPassword(), user.getMdp()) && user.isEnabled()) {
            jwtToken = jwtService.generateToken(user);
            currentUser = user;
            return AuthenticationResponse.builder()
                    .token(jwtToken)
                    .idUser(currentUser.getId())
                    .role(currentUser.getRole().getId())
                    .build();
        }
        return null;
    }

    public void disconnect(PersonneModel portalUser) {
        CompletableFuture.delayedExecutor(30, TimeUnit.SECONDS).execute(() -> {

        });
    }
}
