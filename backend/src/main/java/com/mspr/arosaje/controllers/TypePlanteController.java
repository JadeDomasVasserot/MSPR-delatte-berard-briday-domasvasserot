package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.TypePlanteModel;
import com.mspr.arosaje.repositories.TypePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/type-plante")
@RestController
@Tag(name = "Type Plante")
public class TypePlanteController {

    @Autowired
    private TypePlanteRepository typePlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "recupère tous les types de plante")
    public ResponseEntity<List<TypePlanteModel>> getAllTypePlantes() {
        try {
            List<TypePlanteModel> typePlantes = this.typePlanteRepository.findAll();
            if (typePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(typePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idTypePlante}")
    @Operation(summary = "recupère un type de plante")
    public ResponseEntity<Optional<TypePlanteModel>> getTypePlanteById(@PathVariable("idTypePlante") int idTypePlante) {
        try {
            Optional<TypePlanteModel> typePlanteModel = this.typePlanteRepository.findById(idTypePlante);
            if (typePlanteModel.isPresent()) {
                return new ResponseEntity<>(typePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute un type de plante")
    public ResponseEntity<TypePlanteModel> createTypePlante(@RequestBody TypePlanteModel typePlante) {
        try {
            TypePlanteModel _typePlanteModel = typePlanteRepository
                    .save(typePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_typePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update")
    @Operation(summary = "modifie un type de plante")
    public ResponseEntity<TypePlanteModel> updateTypePlante(@RequestBody TypePlanteModel typePlante) {
        if (typePlante != null) {
            return new ResponseEntity<>(typePlanteRepository.save(typePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime un type de plante")
    public ResponseEntity<HttpStatus> deleteTypePlante(@PathVariable("id") int id) {
        try {
            typePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime tous les types de plante")
    public ResponseEntity<HttpStatus> deleteAllTypePlantes() {
        try {
            typePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
