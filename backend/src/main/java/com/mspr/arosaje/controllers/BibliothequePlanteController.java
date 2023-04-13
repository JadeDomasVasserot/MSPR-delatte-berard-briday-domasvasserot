package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.BibliothequePlanteModel;
import com.mspr.arosaje.repositories.BibliothequePlanteRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/bibliotheque-plante")
@Tag(name = "Bibliothèque Plante")
@RestController
public class BibliothequePlanteController {

    @Autowired
    private BibliothequePlanteRepository bibliothequePlanteRepository;

    @Operation(summary = "récupère toutes les plantes de la bibliothèque")
    @GetMapping("/all")
    public ResponseEntity<List<BibliothequePlanteModel>> getAllBibliothequePlantes() {
        try {
            List<BibliothequePlanteModel> bibliothequePlantes = this.bibliothequePlanteRepository.findAll();
            if (bibliothequePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(bibliothequePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère une plante de la bibliothèque")
    @GetMapping("/id/{idBibliothequePlante}")
    public ResponseEntity<Optional<BibliothequePlanteModel>> getBibliothequePlanteById(@PathVariable("idBibliothequePlante") int idBibliothequePlante) {
        try {
            Optional<BibliothequePlanteModel> bibliothequePlanteModel = this.bibliothequePlanteRepository.findById(idBibliothequePlante);
            if (bibliothequePlanteModel.isPresent()) {
                return new ResponseEntity<>(bibliothequePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @Operation(summary = "ajoute une dans la bibliothèque")
    @PostMapping("/add")
    public ResponseEntity<BibliothequePlanteModel> createBibliothequePlante(@RequestBody BibliothequePlanteModel bibliothequePlante) {
        try {
            BibliothequePlanteModel _bibliothequePlanteModel = bibliothequePlanteRepository
                    .save(bibliothequePlante);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_bibliothequePlanteModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @Operation(summary = "modifie une plante dans la bibliothèque")
    @PutMapping("/update")
    public ResponseEntity<BibliothequePlanteModel> updateBibliothequePlante(@RequestBody BibliothequePlanteModel bibliothequePlante) {

        if (bibliothequePlante != null) {
            return new ResponseEntity<>(bibliothequePlanteRepository.save(bibliothequePlante), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @Operation(summary = "supprime une plante dans la bibliothèque")
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteBibliothequePlante(@PathVariable("id") int id) {
        try {
            bibliothequePlanteRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime toutes les plantes dans la bibliothèque")
    public ResponseEntity<HttpStatus> deleteAllBibliothequePlantes() {
        try {
            bibliothequePlanteRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère toutes les plantes de la bibliothèque selon un type")
    @GetMapping("/all/byType/{idTypePlante}")
    public ResponseEntity<List<BibliothequePlanteModel>> findByTypePlante_IdOrderByNomAsc(@PathVariable("idTypePlante") int typePlanteModel) {
        try {
            List<BibliothequePlanteModel> bibliothequePlantes = this.bibliothequePlanteRepository.findByTypePlante_IdOrderByNomAsc(typePlanteModel);
            if (bibliothequePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(bibliothequePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère toutes les plantes de la bibliothèque selon le nom (utile pour la recherche)")
    @GetMapping("/all/byNom/{nomPlante}")
    public ResponseEntity<List<BibliothequePlanteModel>> findByNomStartsWithOrderByNomAsc(@PathVariable("nomPlante") String nomPlante) {
        try {
            List<BibliothequePlanteModel> bibliothequePlantes = this.bibliothequePlanteRepository.findByNomStartsWithOrderByNomAsc(nomPlante);
            if (bibliothequePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(bibliothequePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }


}
