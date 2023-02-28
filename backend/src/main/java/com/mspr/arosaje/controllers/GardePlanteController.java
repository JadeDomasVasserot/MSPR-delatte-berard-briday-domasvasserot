package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.GardePlanteModel;
import com.mspr.arosaje.models.PersonneModel;
import com.mspr.arosaje.models.PlanteModel;
import com.mspr.arosaje.models.StatutPlanteModel;
import com.mspr.arosaje.repositories.GardePlanteRepository;
import com.mspr.arosaje.repositories.PersonneRepository;
import com.mspr.arosaje.repositories.PlanteRepository;
import com.mspr.arosaje.repositories.StatutPlanteRepository;
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
    @Autowired
    private PlanteRepository planteRepository;
    @Autowired
    private StatutPlanteRepository statutPlanteRepository;
    @Autowired
    private PersonneRepository personneRepository;

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
    @GetMapping("/all/byUser/{idUser}/byStatus/{idStatus}")
    @Operation(summary = "récupère toutes les gardes de plante d'un utilisateur")
    public ResponseEntity<List<GardePlanteModel>> findByPlante_Proprietaire_IdAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(@PathVariable("idUser") int idUser, @PathVariable("idStatus") int idStatus) {
        try {
            List<GardePlanteModel> gardePlantes = this.gardePlanteRepository.findByPlante_Proprietaire_IdAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(idUser, idStatus);
            if (gardePlantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(gardePlantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @Operation(summary = "récupère une toutes les plantes à garder avec le status garde")
    @GetMapping("/all/byAGarder")
    public ResponseEntity<List<GardePlanteModel>> findByStatut_IdOrderByPlante_BibliothequePlante_NomAsc() {
        try {
            List<GardePlanteModel> gardePlanteModel = this.gardePlanteRepository.findByStatut_IdOrderByPlante_BibliothequePlante_NomAsc(2);
            if (gardePlanteModel.size() > 0) {
                return new ResponseEntity<>(gardePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @Operation(summary = "attribue un gardien à la garde et change son statut")
    @PutMapping("/{idGarde}/update/gardien/{idGardien}/status")
    public ResponseEntity<Optional<GardePlanteModel>> updateGardienAndStatus(@PathVariable("idGardien") int idGardien, @PathVariable("idGarde") int gardePlante) {
        try {
            Optional<GardePlanteModel> gardePlanteModel = this.gardePlanteRepository.findById(gardePlante);
            if (gardePlanteModel.isPresent()) {
                Optional <PersonneModel> personneModel = personneRepository.findById(idGardien);
                personneModel.ifPresent(model -> gardePlanteModel.get().setGardien(model));
                Optional<StatutPlanteModel> statutPlanteModel = statutPlanteRepository.findById(1);
                gardePlanteModel.get().setStatut(statutPlanteModel.get());
                gardePlanteRepository.save(gardePlanteModel.get());
                return new ResponseEntity<>(gardePlanteModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/a-garder/byNom/{nom}")
    @Operation(summary = "récupère toutes les plantes à garder par nom")
    public ResponseEntity<List<GardePlanteModel>> findByStatut_IdAndBibliothequePlante_NomStartsWithOrderByBibliothequePlante_NomAsc(@PathVariable("nom") String nom) {
        try {
            List<GardePlanteModel> plantes = this.gardePlanteRepository.findByPlante_BibliothequePlante_NomStartsWithAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc( nom, 2);
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/a-garder/byVille/{ville}")
    @Operation(summary = "récupère toutes les plantes à garder par ville")
    public ResponseEntity<List<GardePlanteModel>> findByStatut_IdAndProprietaire_VilleStartsWithOrderByBibliothequePlante_NomAsc(@PathVariable("ville") String ville) {
        try {
            List<GardePlanteModel> plantes = this.gardePlanteRepository.findByPlante_Proprietaire_VilleStartsWithAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc( ville, 2);
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/a-garder/byTypePlante/{type}")
    @Operation(summary = "récupère toutes les plantes à garder par type")
    public ResponseEntity<List<GardePlanteModel>> findByBibliothequePlante_TypePlante_IdAndStatut_IdOrderByBibliothequePlante_NomAsc(@PathVariable("type") int type) {
        try {
            List<GardePlanteModel> plantes = this.gardePlanteRepository.findByPlante_BibliothequePlante_TypePlante_IdAndStatut_IdOrderByPlante_BibliothequePlante_NomAsc(type, 2);
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/all/garde/byPlante/{idPlante}")
    @Operation(summary = "récupère toutes les gardes d'une plante")
    public ResponseEntity<List<GardePlanteModel>> findByPlante_IdOrderByDateDebutDesc(@PathVariable("idPlante") int idPlante) {
        try {
            List<GardePlanteModel> plantes = this.gardePlanteRepository.findByPlante_IdOrderByDateDebutDesc(idPlante);
            if (plantes.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(plantes, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}

