package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.VisitePlanteModel;
import com.mspr.arosaje.repositories.VisitePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/visite-plante")
@RestController
@Tag(name = "Visite Plante")
public class VisitePlanteController {

    @Autowired
    private VisitePlanteRepository visitePlanteRepository;

    @Operation(summary = "récupère toutes les visites de plantes")
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

    } @Operation(summary = "récupère toutes les visites de plantes")
    @GetMapping("/all/byGarde/{idGarde}")
    public ResponseEntity<List<VisitePlanteModel>> findByGardePlante_IdOrderByGardePlante_DateFinDesc(@PathVariable("idGarde") int idGarde) {
        try {
            List<VisitePlanteModel> visitePlantes = this.visitePlanteRepository.findByGardePlante_IdOrderByGardePlante_DateFinDesc(idGarde);
            if (visitePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(visitePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idVisitePlante}")
    @Operation(summary = "recupère une visite de plante")
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
    @Operation(summary = "ajoute une visite de plante")
    public ResponseEntity<VisitePlanteModel> createVisitePlante(@RequestBody VisitePlanteModel visitePlante) {
        try {
            VisitePlanteModel _visitePlanteModel = visitePlanteRepository
                    .save(visitePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_visitePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update")
    @Operation(summary = "modifie une visite de plante")
    public ResponseEntity<VisitePlanteModel> updateVisitePlante(@RequestBody VisitePlanteModel visitePlante) {
        if (visitePlante != null) {
            return new ResponseEntity<>(visitePlanteRepository.save(visitePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime une visite de plante")
    public ResponseEntity<HttpStatus> deleteVisitePlante(@PathVariable("id") int id) {
        try {
            visitePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les visites de plante")
    public ResponseEntity<HttpStatus> deleteAllVisitePlantes() {
        try {
            visitePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
