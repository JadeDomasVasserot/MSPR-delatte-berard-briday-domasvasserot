package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PersonneModel;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.lang.NonNull;

import java.util.Optional;
import java.util.function.Function;

public interface PersonneRepository extends JpaRepository<PersonneModel, Integer> {
    Optional<PersonneModel> getByEmail(String email);

}