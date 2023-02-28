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

    List<GardePlanteModel> findByPlante_Proprietaire_IdAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(int idUser, int idStatus);

    List<GardePlanteModel> findByStatut_IdOrderByPlante_BibliothequePlante_NomAsc(int id);

    List<GardePlanteModel> findByPlante_BibliothequePlante_NomStartsWithAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(String nom, int id);

    List<GardePlanteModel> findByPlante_Proprietaire_VilleStartsWithAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(String ville, int id);

    List<GardePlanteModel> findByPlante_BibliothequePlante_TypePlante_IdAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(int id, int id1);

    List<GardePlanteModel> findByPlante_IdOrderByDateDebutDesc(int id);

    List<GardePlanteModel> findByGardien_IdOrderByDateDebutAsc(int id);




    






}