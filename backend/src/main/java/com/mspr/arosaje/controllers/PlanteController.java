package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GardePlanteModel;
import com.mspr.arosaje.models.PlanteModel;
import com.mspr.arosaje.repositories.PlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/plante")
@RestController
@Tag(name = "Plante")
public class PlanteController {

    @Autowired
    private PlanteRepository planteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère toutes les plantes")
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
    @GetMapping("/all/string")
    @Operation(summary = "récupère toutes les plantes")
    public String testString() {
        try {

            return "rest";
        } catch (Exception e) {
            return null;
        }

    }
    @GetMapping("/id/{idPlante}")
    @Operation(summary = "récupère une plante selon id")
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

    @PostMapping("/add")
    @Operation(summary = "ajoute une plante")
    public ResponseEntity<PlanteModel> createPlante(@RequestBody PlanteModel plante) {
        try {
            PlanteModel _planteModel = planteRepository
                    .save(plante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_planteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update")
    @Operation(summary = "modifie une plante")
    public ResponseEntity<PlanteModel> updatePlante(@RequestBody PlanteModel plante) {
        if (plante != null) {
            return new ResponseEntity<>(planteRepository.save(plante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime une plante")
    public ResponseEntity<HttpStatus> deletePlante(@PathVariable("id") int id) {
        try {
            planteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les plantes")
    public ResponseEntity<HttpStatus> deleteAllPlantes() {
        try {
            planteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/all/byUser/{idUser}")
    @Operation(summary = "récupère toutes les plantes d'un utilisateur")
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

    @GetMapping("/byUser/{user}/byTypePlante/{type}")
    @Operation(summary = "récupère toutes les plantes d'un utilisateur par type")
    public ResponseEntity<List<PlanteModel>> findByProprietaire_IdAndBibliothequePlante_TypePlante_IdOrderByBibliothequePlante_NomAsc(@PathVariable("type") int type, @PathVariable("user") int user) {
        try {
            List<PlanteModel> plantes = this.planteRepository.findByProprietaire_IdAndBibliothequePlante_TypePlante_IdOrderByBibliothequePlante_NomAsc(user, type );
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
