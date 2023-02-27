package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PhotoBibliothequePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface PhotoBibliothequePlanteRepository extends JpaRepository<PhotoBibliothequePlanteModel, Integer> {
    List<PhotoBibliothequePlanteModel> findByBibliothequePlante_IdOrderByIdDesc(int id);

    Optional<PhotoBibliothequePlanteModel> findFirstByBibliothequePlante_IdOrderByIdDesc(int id);





}