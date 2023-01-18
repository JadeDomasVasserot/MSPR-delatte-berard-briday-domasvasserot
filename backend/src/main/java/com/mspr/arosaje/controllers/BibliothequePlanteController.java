package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.BibliothequePlanteModel;
import com.mspr.arosaje.repositories.BibliothequePlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/bibliotheque-plante")
@RestController
public class BibliothequePlanteController {

    @Autowired
    private BibliothequePlanteRepository bibliothequePlanteRepository;

    @GetMapping("/all")
    public ResponseEntity<List<BibliothequePlanteModel>> getAllBibliothequePlantes() {
        try {
            List<BibliothequePlanteModel> bibliothequePlantes = this.bibliothequePlanteRepository.findAll();
            if (bibliothequePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(bibliothequePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idBibliothequePlante}")
    public ResponseEntity<Optional<BibliothequePlanteModel>> getBibliothequePlanteById(@PathVariable("idBibliothequePlante") int idBibliothequePlante) {
        try {
            Optional<BibliothequePlanteModel> bibliothequePlanteModel = this.bibliothequePlanteRepository.findById(idBibliothequePlante);
            if (bibliothequePlanteModel.isPresent()) {
                return new ResponseEntity<>(bibliothequePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    public ResponseEntity<BibliothequePlanteModel> createTutorial(@RequestBody BibliothequePlanteModel bibliothequePlante) {
        try {
            BibliothequePlanteModel _bibliothequePlanteModel = bibliothequePlanteRepository
                    .save(bibliothequePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_bibliothequePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<BibliothequePlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody BibliothequePlanteModel bibliothequePlante) {
        Optional<BibliothequePlanteModel> bibliothequePlanteData = bibliothequePlanteRepository.findById(id);

        if (bibliothequePlanteData.isPresent()) {
            BibliothequePlanteModel _bibliothequePlante = bibliothequePlanteData.get();
            _bibliothequePlante.setNom(bibliothequePlante.getNom());
           // a faire pour tous les attributs
            return new ResponseEntity<>(bibliothequePlanteRepository.save(_bibliothequePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            bibliothequePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            bibliothequePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
