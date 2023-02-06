package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.StatutPlanteModel;
import com.mspr.arosaje.repositories.StatutPlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/statut-plante")
@RestController
@Tag(name = "Statut Plante")

public class StatutPlanteController {

    @Autowired
    private StatutPlanteRepository statutPlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère tous les statuts de plante")
    public ResponseEntity<List<StatutPlanteModel>> getAllStatutPlantes() {
        try {
            List<StatutPlanteModel> statutPlantes = this.statutPlanteRepository.findAll();
            if (statutPlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(statutPlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idStatutPlante}")
    @Operation(summary = "récupère un statut de plante")
    public ResponseEntity<Optional<StatutPlanteModel>> getStatutPlanteById(@PathVariable("idStatutPlante") int idStatutPlante) {
        try {
            Optional<StatutPlanteModel> statutPlanteModel = this.statutPlanteRepository.findById(idStatutPlante);
            if (statutPlanteModel.isPresent()) {
                return new ResponseEntity<>(statutPlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute un statut de plante")
    public ResponseEntity<StatutPlanteModel> createStatutPlante(@RequestBody StatutPlanteModel statutPlante) {
        try {
            StatutPlanteModel _statutPlanteModel = statutPlanteRepository
                    .save(statutPlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_statutPlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    @Operation(summary = "modifie un statut de plante")
    public ResponseEntity<StatutPlanteModel> updateStatutPlante(@PathVariable("id") int id, @RequestBody StatutPlanteModel statutPlante) {
        Optional<StatutPlanteModel> statutPlanteData = statutPlanteRepository.findById(id);

        if (statutPlanteData.isPresent()) {
            StatutPlanteModel _statutPlante = statutPlanteData.get();
            _statutPlante.setId(statutPlante.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(statutPlanteRepository.save(_statutPlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime un statut de plante")
    public ResponseEntity<HttpStatus> deleteStatutPlante(@PathVariable("id") int id) {
        try {
            statutPlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime tous les statuts de plante")
    public ResponseEntity<HttpStatus> deleteAllStatutPlantes() {
        try {
            statutPlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
