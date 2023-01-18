package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PersonneModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonneRepository extends JpaRepository<PersonneModel, Integer> {

}