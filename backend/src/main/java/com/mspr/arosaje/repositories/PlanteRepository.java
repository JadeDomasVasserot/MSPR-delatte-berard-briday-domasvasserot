package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.Optional;

public interface PlanteRepository extends JpaRepository<PlanteModel, Integer> {

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.proprietaire.id = ?1 ")
    List<PlanteModel> getAllPlantesByIdUser(int idUser);

    List<PlanteModel> findByProprietaire_IdAndBibliothequePlante_TypePlante_IdOrderByBibliothequePlante_NomAsc(int id, int id1);

}