package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.CommentaireModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentaireRepository extends JpaRepository<CommentaireModel, Integer> {


    List<CommentaireModel> findByGardePlante_Id(int id);


}