package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.BibliothequePlanteModel;
import com.mspr.arosaje.models.TypePlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;

import java.util.List;

public interface BibliothequePlanteRepository extends JpaRepository<BibliothequePlanteModel, Integer> {
    List<BibliothequePlanteModel> findByTypePlante_IdOrderByNomAsc(int id);

    List<BibliothequePlanteModel> findByNomStartsWithOrderByNomAsc(@NonNull String nom);


}