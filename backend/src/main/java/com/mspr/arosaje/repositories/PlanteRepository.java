package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.Optional;

public interface PlanteRepository extends JpaRepository<PlanteModel, Integer> {

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.statut.id = 2 ")
    List<PlanteModel> getAllPlantesAGarde();

    @Query("SELECT p FROM PlanteModel p " +
            "WHERE p.proprietaire.id = ?1 ")
    List<PlanteModel> getAllPlantesByIdUser(int idUser);


    List<PlanteModel> findByBibliothequePlante_TypePlante_IdAndStatut_IdOrderByBibliothequePlante_NomAsc(@NonNull int id, @NonNull int id1);

    List<PlanteModel> findByStatut_IdAndBibliothequePlante_NomStartsWithOrderByBibliothequePlante_NomAsc(@NonNull int id, String nom);

    List<PlanteModel> findByStatut_IdAndProprietaire_VilleStartsWithOrderByBibliothequePlante_NomAsc(@NonNull int id, String ville);




}