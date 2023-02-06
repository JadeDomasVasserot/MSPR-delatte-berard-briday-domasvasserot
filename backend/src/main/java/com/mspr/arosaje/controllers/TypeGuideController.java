package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.TypeGuideModel;
import com.mspr.arosaje.repositories.TypeGuideRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/type-guide")
@RestController
@Tag(name = "Type Guide")
public class TypeGuideController {

    @Autowired
    private TypeGuideRepository typeGuideRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère tous les types guide de plante")
    public ResponseEntity<List<TypeGuideModel>> getAllTypeGuides() {
        try {
            List<TypeGuideModel> typeGuides = this.typeGuideRepository.findAll();
            if (typeGuides.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(typeGuides, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idTypeGuide}")
    @Operation(summary = "récupère un type guide de plante")
    public ResponseEntity<Optional<TypeGuideModel>> getTypeGuideById(@PathVariable("idTypeGuide") int idTypeGuide) {
        try {
            Optional<TypeGuideModel> typeGuideModel = this.typeGuideRepository.findById(idTypeGuide);
            if (typeGuideModel.isPresent()) {
                return new ResponseEntity<>(typeGuideModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute un type guide de plante")
    public ResponseEntity<TypeGuideModel> createTypeGuide(@RequestBody TypeGuideModel typeGuide) {
        try {
            TypeGuideModel _typeGuideModel = typeGuideRepository
                    .save(typeGuide);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_typeGuideModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    @Operation(summary = "modifie un type guide de plante")
    public ResponseEntity<TypeGuideModel> updateTypeGuide(@PathVariable("id") int id, @RequestBody TypeGuideModel typeGuide) {
        Optional<TypeGuideModel> typeGuideData = typeGuideRepository.findById(id);

        if (typeGuideData.isPresent()) {
            TypeGuideModel _typeGuide = typeGuideData.get();
            _typeGuide.setId(typeGuide.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(typeGuideRepository.save(_typeGuide), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime un type guide de plante")
    public ResponseEntity<HttpStatus> deleteTypeGuide(@PathVariable("id") int id) {
        try {
            typeGuideRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime tous les types guide de plante")
    public ResponseEntity<HttpStatus> deleteAllTypeGuides() {
        try {
            typeGuideRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
