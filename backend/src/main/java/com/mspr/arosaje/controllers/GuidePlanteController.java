package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GuidePlanteModel;
import com.mspr.arosaje.repositories.GuidePlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/guide-plante")
@RestController
public class GuidePlanteController {

    @Autowired
    private GuidePlanteRepository guidePlanteRepository;

    @GetMapping("/all")
    public ResponseEntity<List<GuidePlanteModel>> getAllGuidePlantes() {
        try {
            List<GuidePlanteModel> guidePlantes = this.guidePlanteRepository.findAll();
            if (guidePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(guidePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idGuidePlante}")
    public ResponseEntity<Optional<GuidePlanteModel>> getGuidePlanteById(@PathVariable("idGuidePlante") int idGuidePlante) {
        try {
            Optional<GuidePlanteModel> guidePlanteModel = this.guidePlanteRepository.findById(idGuidePlante);
            if (guidePlanteModel.isPresent()) {
                return new ResponseEntity<>(guidePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/add")
    public ResponseEntity<GuidePlanteModel> createTutorial(@RequestBody GuidePlanteModel guidePlante) {
        try {
            GuidePlanteModel _guidePlanteModel = guidePlanteRepository
                    .save(guidePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_guidePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<GuidePlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody GuidePlanteModel guidePlante) {
        Optional<GuidePlanteModel> guidePlanteData = guidePlanteRepository.findById(id);

        if (guidePlanteData.isPresent()) {
            GuidePlanteModel _guidePlante = guidePlanteData.get();
            _guidePlante.setTitre(guidePlante.getTitre());
           // a faire pour tous les attributs
            return new ResponseEntity<>(guidePlanteRepository.save(_guidePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            guidePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            guidePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
