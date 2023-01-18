package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.TypePlanteModel;
import com.mspr.arosaje.repositories.TypePlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/type-plante")
@RestController
public class TypePlanteController {

    @Autowired
    private TypePlanteRepository typePlanteRepository;

    @GetMapping("/all")
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
    public ResponseEntity<TypePlanteModel> createTutorial(@RequestBody TypePlanteModel typePlante) {
        try {
            TypePlanteModel _typePlanteModel = typePlanteRepository
                    .save(typePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_typePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<TypePlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody TypePlanteModel typePlante) {
        Optional<TypePlanteModel> typePlanteData = typePlanteRepository.findById(id);

        if (typePlanteData.isPresent()) {
            TypePlanteModel _typePlante = typePlanteData.get();
            _typePlante.setId(typePlante.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(typePlanteRepository.save(_typePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            typePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            typePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
