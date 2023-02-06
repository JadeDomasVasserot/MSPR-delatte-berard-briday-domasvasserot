package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.PhotoBibliothequePlanteModel;
import com.mspr.arosaje.repositories.PhotoBibliothequePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/photo-bibliotheque-plante")
@RestController
@Tag(name = "Photo Bibliothèque Plante")
public class PhotoBibliothequePlanteController {

    @Autowired
    private PhotoBibliothequePlanteRepository photoBibliothequePlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère toutes les photos de la bibliothèque de plante")
    public ResponseEntity<List<PhotoBibliothequePlanteModel>> getAllPhotoBibliothequePlantes() {
        try {
            List<PhotoBibliothequePlanteModel> photoBibliothequePlantes = this.photoBibliothequePlanteRepository.findAll();
            if (photoBibliothequePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(photoBibliothequePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idPhotoBibliothequePlante}")
    @Operation(summary = "récupère une photo de la bibliothèque de plante")
    public ResponseEntity<Optional<PhotoBibliothequePlanteModel>> getPhotoBibliothequePlanteById(@PathVariable("idPhotoBibliothequePlante") int idPhotoBibliothequePlante) {
        try {
            Optional<PhotoBibliothequePlanteModel> photoBibliothequePlanteModel = this.photoBibliothequePlanteRepository.findById(idPhotoBibliothequePlante);
            if (photoBibliothequePlanteModel.isPresent()) {
                return new ResponseEntity<>(photoBibliothequePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute une photo de la bibliothèque de plante")
    public ResponseEntity<PhotoBibliothequePlanteModel> createPhotoBibliothequePlante(@RequestBody PhotoBibliothequePlanteModel photoBibliothequePlante) {
        try {
            PhotoBibliothequePlanteModel _photoBibliothequePlanteModel = photoBibliothequePlanteRepository
                    .save(photoBibliothequePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_photoBibliothequePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    @Operation(summary = "modifie une photo de la bibliothèque de plante")
    public ResponseEntity<PhotoBibliothequePlanteModel> updatePhotoBibliothequePlante(@PathVariable("id") int id, @RequestBody PhotoBibliothequePlanteModel photoBibliothequePlante) {
        Optional<PhotoBibliothequePlanteModel> photoBibliothequePlanteData = photoBibliothequePlanteRepository.findById(id);

        if (photoBibliothequePlanteData.isPresent()) {
            PhotoBibliothequePlanteModel _photoBibliothequePlante = photoBibliothequePlanteData.get();
            _photoBibliothequePlante.setId(photoBibliothequePlante.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(photoBibliothequePlanteRepository.save(_photoBibliothequePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime une photo de la bibliothèque de plante")
    public ResponseEntity<HttpStatus> deletePhotoBibliothequePlante(@PathVariable("id") int id) {
        try {
            photoBibliothequePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les photos de la bibliothèque de plante")
    public ResponseEntity<HttpStatus> deleteAllPhotoBibliothequePlantes() {
        try {
            photoBibliothequePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
