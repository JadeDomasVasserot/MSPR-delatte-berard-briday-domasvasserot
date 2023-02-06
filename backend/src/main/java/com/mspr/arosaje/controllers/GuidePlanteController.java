package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GuidePlanteModel;
import com.mspr.arosaje.repositories.GuidePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/guide-plante")
@RestController
@Tag(name = "Guide Plante")
public class GuidePlanteController {

    @Autowired
    private GuidePlanteRepository guidePlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère tous les guides de plante")
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
    @Operation(summary = "récupère un guide de plante")
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
    @Operation(summary = "ajoute un guide de plante")
    public ResponseEntity<GuidePlanteModel> createGuidePlante(@RequestBody GuidePlanteModel guidePlante) {
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
    @Operation(summary = "modifie un guide de plante")
    public ResponseEntity<GuidePlanteModel> updateGuidePlante(@PathVariable("id") int id, @RequestBody GuidePlanteModel guidePlante) {
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
    @Operation(summary = "supprime un guide de plante")
    public ResponseEntity<HttpStatus> deleteGuidePlante(@PathVariable("id") int id) {
        try {
            guidePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime tous les guides de plante")
    public ResponseEntity<HttpStatus> deleteAllGuidePlantes() {
        try {
            guidePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
