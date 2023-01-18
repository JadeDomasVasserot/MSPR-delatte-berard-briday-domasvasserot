package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.PhotoPlanteModel;
import com.mspr.arosaje.repositories.PhotoPlanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/photo-plante")
@RestController
public class PhotoPlanteController {

    @Autowired
    private PhotoPlanteRepository photoPlanteRepository;

    @GetMapping("/all")
    public ResponseEntity<List<PhotoPlanteModel>> getAllPhotoPlantes() {
        try {
            List<PhotoPlanteModel> photoPlantes = this.photoPlanteRepository.findAll();
            if (photoPlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(photoPlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idPhotoPlante}")
    public ResponseEntity<Optional<PhotoPlanteModel>> getPhotoPlanteById(@PathVariable("idPhotoPlante") int idPhotoPlante) {
        try {
            Optional<PhotoPlanteModel> photoPlanteModel = this.photoPlanteRepository.findById(idPhotoPlante);
            if (photoPlanteModel.isPresent()) {
                return new ResponseEntity<>(photoPlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    public ResponseEntity<PhotoPlanteModel> createTutorial(@RequestBody PhotoPlanteModel photoPlante) {
        try {
            PhotoPlanteModel _photoPlanteModel = photoPlanteRepository
                    .save(photoPlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_photoPlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<PhotoPlanteModel> updateTutorial(@PathVariable("id") int id, @RequestBody PhotoPlanteModel photoPlante) {
        Optional<PhotoPlanteModel> photoPlanteData = photoPlanteRepository.findById(id);

        if (photoPlanteData.isPresent()) {
            PhotoPlanteModel _photoPlante = photoPlanteData.get();
            _photoPlante.setId(photoPlante.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(photoPlanteRepository.save(_photoPlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            photoPlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            photoPlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
