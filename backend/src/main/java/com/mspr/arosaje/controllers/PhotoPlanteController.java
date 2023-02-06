package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.PhotoPlanteModel;
import com.mspr.arosaje.repositories.PhotoPlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/photo-plante")
@RestController
@Tag(name = "Photo Plante")
public class PhotoPlanteController {

    @Autowired
    private PhotoPlanteRepository photoPlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère toutes les photos de la plante")
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
    @Operation(summary = "récupère une photo de la plante")

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
    @Operation(summary = "ajoute une photo de la plante")
    public ResponseEntity<PhotoPlanteModel> createPhotoPlante(@RequestBody PhotoPlanteModel photoPlante) {
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
    @Operation(summary = "modifie une photo de la plante")
    public ResponseEntity<PhotoPlanteModel> updatePhotoPlante(@PathVariable("id") int id, @RequestBody PhotoPlanteModel photoPlante) {
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
    @Operation(summary = "supprime une photo de la plante")
    public ResponseEntity<HttpStatus> deletePhotoPlante(@PathVariable("id") int id) {
        try {
            photoPlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les photos de la plante")
    public ResponseEntity<HttpStatus> deleteAllPhotoPlantes() {
        try {
            photoPlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/all/idPlante/{idPhotoPlante}")
    @Operation(summary = "récupère toutes les photos d'une plante")

    public ResponseEntity<List<PhotoPlanteModel>> getByPlante_Id(@PathVariable("idPlante") int idPlante) {
        try {
            List<PhotoPlanteModel> photoPlanteModel = this.photoPlanteRepository.findByPlante_Id(idPlante);
            if (photoPlanteModel.size() > 0) {
                return new ResponseEntity<>(photoPlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/one/idPlante/{idPhotoPlante}")
    @Operation(summary = "récupère la dernière photo d'une plante")

    public ResponseEntity<Optional<PhotoPlanteModel>> getUrlOfPhotoPlante(@PathVariable("idPlante") int idPlante) {
        try {
            Optional<PhotoPlanteModel> photoPlanteModel = this.photoPlanteRepository.findFirstByPlante_IdOrderByIdDesc(idPlante);
            if (photoPlanteModel.isPresent()) {
                return new ResponseEntity<>(photoPlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
