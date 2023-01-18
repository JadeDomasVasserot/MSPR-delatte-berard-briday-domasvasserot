package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.CommentaireModel;
import com.mspr.arosaje.repositories.CommentaireRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/commentaire")
@RestController
public class CommentaireController {

    @Autowired
    private CommentaireRepository commentaireRepository;

    @GetMapping("/all")
    public ResponseEntity<List<CommentaireModel>> getAllCommentaires() {
        try {
            List<CommentaireModel> commentaires = this.commentaireRepository.findAll();
            if (commentaires.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(commentaires, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idCommentaire}")
    public ResponseEntity<Optional<CommentaireModel>> getCommentaireById(@PathVariable("idCommentaire") int idCommentaire) {
        try {
            Optional<CommentaireModel> commentaireModel = this.commentaireRepository.findById(idCommentaire);
            if (commentaireModel.isPresent()) {
                return new ResponseEntity<>(commentaireModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    public ResponseEntity<CommentaireModel> createTutorial(@RequestBody CommentaireModel commentaire) {
        try {
            CommentaireModel _commentaireModel = commentaireRepository
                    .save(commentaire);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_commentaireModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<CommentaireModel> updateTutorial(@PathVariable("id") int id, @RequestBody CommentaireModel commentaire) {
        Optional<CommentaireModel> commentaireData = commentaireRepository.findById(id);

        if (commentaireData.isPresent()) {
            CommentaireModel _commentaire = commentaireData.get();
            _commentaire.setTitre(commentaire.getTitre());
           // a faire pour tous les attributs
            return new ResponseEntity<>(commentaireRepository.save(_commentaire), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            commentaireRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            commentaireRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/all/byPlante/{idPlante}")

    public ResponseEntity<List<CommentaireModel>> getAllCommentaireByPlante(@PathVariable("idPlante") int idPlante) {
        try {
            List<CommentaireModel> commentaires = this.commentaireRepository.getAllCommentaireByPlante(idPlante);
            if (commentaires.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(commentaires, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
