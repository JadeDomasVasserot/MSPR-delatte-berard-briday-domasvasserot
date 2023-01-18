package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GardePlanteModel;
import com.mspr.arosaje.models.PlanteModel;
import com.mspr.arosaje.repositories.PlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/plante")
@RestController
public class PlanteController {

    @Autowired
    private PlanteRepository planteRepository;

    @GetMapping("/all")
    public ResponseEntity<List<PlanteModel>> getAllPlantes() {
        try {
            List<PlanteModel> plantes = this.planteRepository.findAll();
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idPlante}")
    public ResponseEntity<Optional<PlanteModel>> getPlanteById(@PathVariable("idPlante") int idPlante) {
        try {
            Optional<PlanteModel> planteModel = this.planteRepository.findById(idPlante);
            if (planteModel.isPresent()) {
                return new ResponseEntity<>(planteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/name/{namePlante}")
    public ResponseEntity<Optional<PlanteModel>> getPlanteById(@PathVariable("namePlante") String namePlante) {
        try {
            Optional<PlanteModel> planteModel = this.planteRepository.getPlanteByName(namePlante);
            if (planteModel.isPresent()) {
                return new ResponseEntity<>(planteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/add")
    public ResponseEntity<PlanteModel> createTutorial(@RequestBody PlanteModel plante) {
        try {
            PlanteModel _planteModel = planteRepository
                    .save(plante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_planteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<PlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody PlanteModel plante) {
        Optional<PlanteModel> planteData = planteRepository.findById(id);

        if (planteData.isPresent()) {
            PlanteModel _plante = planteData.get();
            _plante.setNom(plante.getNom());
           // a faire pour tous les attributs
            return new ResponseEntity<>(planteRepository.save(_plante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            planteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            planteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/a-garder/all")
    public ResponseEntity<List<PlanteModel>> getAllPlantesAGarder() {
        try {
            List<PlanteModel> plantes = this.planteRepository.getAllPlantesAGarde();
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/all/byUser/{idUser}")
    public ResponseEntity<List<PlanteModel>> getAllPlanteByIdUser(@PathVariable("idUser") int idUser) {
        try {
            List<PlanteModel> plantes = this.planteRepository.getAllPlantesByIdUser(idUser);
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
