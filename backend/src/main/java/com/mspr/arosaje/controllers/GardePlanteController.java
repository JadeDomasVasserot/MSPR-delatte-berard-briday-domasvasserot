package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GardePlanteModel;
import com.mspr.arosaje.repositories.GardePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/garde-plante")
@RestController
@Tag(name = "Garde Plante")
public class GardePlanteController {

    @Autowired
    private GardePlanteRepository gardePlanteRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère toutes les gardes de plante")
    public ResponseEntity<List<GardePlanteModel>> getAllGardePlantes() {
        try {
            List<GardePlanteModel> gardePlantes = this.gardePlanteRepository.findAll();
            if (gardePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(gardePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère une garde de plante")
    @GetMapping("/id/{idGardePlante}")
    public ResponseEntity<Optional<GardePlanteModel>> getGardePlanteById(@PathVariable("idGardePlante") int idGardePlante) {
        try {
            Optional<GardePlanteModel> gardePlanteModel = this.gardePlanteRepository.findById(idGardePlante);
            if (gardePlanteModel.isPresent()) {
                return new ResponseEntity<>(gardePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    @Operation(summary = "ajoute une garde de plante")
    public ResponseEntity<GardePlanteModel> createGardePlante(@RequestBody GardePlanteModel gardePlante) {
        try {

            GardePlanteModel _gardePlanteModel = gardePlanteRepository
                    .save(gardePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_gardePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update")
    @Operation(summary = "modifie une garde de plante")

    public ResponseEntity<GardePlanteModel> updateGardePlante(@RequestBody GardePlanteModel gardePlante) {
        if (gardePlante != null) {
            return new ResponseEntity<>(gardePlanteRepository.save(gardePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime une garde de plante")
    public ResponseEntity<HttpStatus> deleteGardePlante(@PathVariable("id") int id) {
        try {
            gardePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les gardes de plante")
    public ResponseEntity<HttpStatus> deleteAllGardePlantes() {
        try {
            gardePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/all/byUser/{idUser}")
    @Operation(summary = "récupère toutes les gardes de plante d'un utilisateur")
    public ResponseEntity<List<GardePlanteModel>> getAllGardePlanteByUser(@PathVariable("idUser") int idUser) {
        try {
            List<GardePlanteModel> gardePlantes = this.gardePlanteRepository.getAllGardePlanteByUser(idUser);
            if (gardePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(gardePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère une garde de plante par une plante")
    @GetMapping("/id/byPlante/{idPlante}")
    public ResponseEntity<Optional<GardePlanteModel>> findByPlante_Id(@PathVariable("idPlante") int idPlante) {
        try {
            Optional<GardePlanteModel> gardePlanteModel = this.gardePlanteRepository.findByPlante_Id(idPlante);
            if (gardePlanteModel.isPresent()) {
                return new ResponseEntity<>(gardePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

