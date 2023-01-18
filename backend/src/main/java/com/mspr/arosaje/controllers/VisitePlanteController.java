package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.VisitePlanteModel;
import com.mspr.arosaje.repositories.VisitePlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/visite-plante")
@RestController
public class VisitePlanteController {

    @Autowired
    private VisitePlanteRepository visitePlanteRepository;

    @GetMapping("/all")
    public ResponseEntity<List<VisitePlanteModel>> getAllVisitePlantes() {
        try {
            List<VisitePlanteModel> visitePlantes = this.visitePlanteRepository.findAll();
            if (visitePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(visitePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idVisitePlante}")
    public ResponseEntity<Optional<VisitePlanteModel>> getVisitePlanteById(@PathVariable("idVisitePlante") int idVisitePlante) {
        try {
            Optional<VisitePlanteModel> visitePlanteModel = this.visitePlanteRepository.findById(idVisitePlante);
            if (visitePlanteModel.isPresent()) {
                return new ResponseEntity<>(visitePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    public ResponseEntity<VisitePlanteModel> createTutorial(@RequestBody VisitePlanteModel visitePlante) {
        try {
            VisitePlanteModel _visitePlanteModel = visitePlanteRepository
                    .save(visitePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_visitePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<VisitePlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody VisitePlanteModel visitePlante) {
        Optional<VisitePlanteModel> visitePlanteData = visitePlanteRepository.findById(id);

        if (visitePlanteData.isPresent()) {
            VisitePlanteModel _visitePlante = visitePlanteData.get();
            _visitePlante.setId(visitePlante.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(visitePlanteRepository.save(_visitePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            visitePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            visitePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
