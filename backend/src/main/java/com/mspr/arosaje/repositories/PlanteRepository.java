package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface PlanteRepository extends JpaRepository<PlanteModel, Integer> {

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.nom = ?1 ")
    Optional<PlanteModel> getPlanteByName(String namePlante);

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.statut.id = 1 ")
    List<PlanteModel> getAllPlantesAGarde();

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.proprietaire.id = ?1 ")
    List<PlanteModel> getAllPlantesByIdUser(int idUser);
}