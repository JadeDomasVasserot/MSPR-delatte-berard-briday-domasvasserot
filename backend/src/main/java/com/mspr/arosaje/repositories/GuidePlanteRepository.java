package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.GuidePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GuidePlanteRepository extends JpaRepository<GuidePlanteModel, Integer> {
    List<GuidePlanteModel> findByBibliothequePlante_IdOrderByTypeGuide_NomAsc(int id);


}