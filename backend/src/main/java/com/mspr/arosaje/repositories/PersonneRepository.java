package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PersonneModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PersonneRepository extends JpaRepository<PersonneModel, Integer> {
    Optional<PersonneModel> getByEmail(String email);

}