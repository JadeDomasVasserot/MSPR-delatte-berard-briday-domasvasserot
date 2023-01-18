package com.mspr.arosaje.repositories;

import com.mspr.arosaje.models.CommentaireModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CommentaireRepository extends JpaRepository<CommentaireModel, Integer> {
    @Query("SELECT c FROM CommentaireModel c " +
            "WHERE c.plante.id = ?1 ")
    List<CommentaireModel> getAllCommentaireByPlante(int idPlante);

}