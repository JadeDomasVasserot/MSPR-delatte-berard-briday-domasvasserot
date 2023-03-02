package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.CommentaireModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;

import java.util.List;

public interface CommentaireRepository extends JpaRepository<CommentaireModel, Integer> {


    List<CommentaireModel> findByGardePlante_Id(int id);

    List<CommentaireModel> findByAuteur_Role_IdAndGardePlante_IdOrderByIdDesc(int id, int id1);



    


}