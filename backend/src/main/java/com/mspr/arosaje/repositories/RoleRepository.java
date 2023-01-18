package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PlanteModel;
import com.mspr.arosaje.models.RoleModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<RoleModel, Integer> {

}