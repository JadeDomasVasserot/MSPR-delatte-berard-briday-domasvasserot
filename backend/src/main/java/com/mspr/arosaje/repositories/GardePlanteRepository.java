package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.GardePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface GardePlanteRepository extends JpaRepository<GardePlanteModel, Integer> {

    @Query("SELECT Gp FROM GardePlanteModel Gp " +
            "WHERE Gp.plante.proprietaire.id = ?1 ")

    List<GardePlanteModel> getAllGardePlanteByUser(int idUser);
}