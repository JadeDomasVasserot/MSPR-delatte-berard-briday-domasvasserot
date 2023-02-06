package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.PersonneModel;
import com.mspr.arosaje.repositories.PersonneRepository;
import com.mspr.arosaje.repositories.PersonneRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/personne")
@RestController
@Tag(name = "Personne ")
public class PersonneController {

    @Autowired
    private PersonneRepository personneRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère les utilisateurs")
    public ResponseEntity<List<PersonneModel>> getAllPersonnes() {
        try {
            List<PersonneModel> personnes = this.personneRepository.findAll();
            if (personnes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(personnes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idPersonne}")
    @Operation(summary = "récupère un utilisateur")
    public ResponseEntity<Optional<PersonneModel>> getPersonneById(@PathVariable("idPersonne") int idPersonne) {
        try {
            Optional<PersonneModel> personneModel = this.personneRepository.findById(idPersonne);
            if (personneModel.isPresent()) {
                return new ResponseEntity<>(personneModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute un utilisateur")
    public ResponseEntity<PersonneModel> createPersonne(@RequestBody PersonneModel personne) {
        try {
            PersonneModel _personneModel = personneRepository
                    .save(personne);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_personneModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    @Operation(summary = "modifie un utilisateur")
    public ResponseEntity<PersonneModel> updatePersonne(@PathVariable("id") int id, @RequestBody PersonneModel personne) {
        Optional<PersonneModel> personneData = personneRepository.findById(id);

        if (personneData.isPresent()) {
            PersonneModel _personne = personneData.get();
            _personne.setNom(personne.getNom());
           // a faire pour tous les attributs
            return new ResponseEntity<>(personneRepository.save(_personne), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime un utilisateur")
    public ResponseEntity<HttpStatus> deletePersonne(@PathVariable("id") int id) {
        try {
            personneRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprimer tous les utilisateurs")
    public ResponseEntity<HttpStatus> deleteAllPersonnes() {
        try {
            personneRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
