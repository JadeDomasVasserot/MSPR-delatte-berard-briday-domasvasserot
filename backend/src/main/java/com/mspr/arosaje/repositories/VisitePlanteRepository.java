package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.VisitePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;

import java.util.List;

public interface VisitePlanteRepository extends JpaRepository<VisitePlanteModel, Integer> {
    List<VisitePlanteModel> findByGardePlante_IdOrderByGardePlante_DateFinDesc(@NonNull int id);


}