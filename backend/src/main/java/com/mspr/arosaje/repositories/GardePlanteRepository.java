package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.GardePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.Optional;

public interface GardePlanteRepository extends JpaRepository<GardePlanteModel, Integer> {

    @Query("SELECT Gp FROM GardePlanteModel Gp " +
            "WHERE Gp.plante.proprietaire.id = ?1 ")

    List<GardePlanteModel> getAllGardePlanteByUser(int idUser);

    Optional<GardePlanteModel> findByPlante_Id(@NonNull int id);


}