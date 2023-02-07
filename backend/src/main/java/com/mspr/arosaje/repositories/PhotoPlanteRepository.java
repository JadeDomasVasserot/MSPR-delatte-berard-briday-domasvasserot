package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.PhotoPlanteModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;

import java.util.List;
import java.util.Optional;

public interface PhotoPlanteRepository extends JpaRepository<PhotoPlanteModel, Integer> {
    List<PhotoPlanteModel> findByPlante_Id(int id);

    Optional<PhotoPlanteModel> findFirstByPlante_IdOrderByIdDesc(@NonNull int id);

}