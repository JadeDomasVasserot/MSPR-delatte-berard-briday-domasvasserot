package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.RoleModel;
import com.mspr.arosaje.repositories.RoleRepository;
import com.mspr.arosaje.repositories.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:8081")
@RequestMapping("/role")
@RestController
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/all")
    public ResponseEntity<List<RoleModel>> getAllRoles() {
        try {
            List<RoleModel> roles = this.roleRepository.findAll();
            if (roles.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(roles, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }
    @GetMapping("/id/{idRole}")
    public ResponseEntity<Optional<RoleModel>> getRoleById(@PathVariable("idRole") int idRole) {
        try {
            Optional<RoleModel> roleModel = this.roleRepository.findById(idRole);
            if (roleModel.isPresent()) {
                return new ResponseEntity<>(roleModel, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/add")
    public ResponseEntity<RoleModel> createTutorial(@RequestBody RoleModel role) {
        try {
            RoleModel _roleModel = roleRepository
                    .save(role);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_roleModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update/{id}")
    public ResponseEntity<RoleModel> updateTutorial(@PathVariable("id") int id, @RequestBody RoleModel role) {
        Optional<RoleModel> roleData = roleRepository.findById(id);

        if (roleData.isPresent()) {
            RoleModel _role = roleData.get();
            _role.setId(role.getId());
           // a faire pour tous les attributs
            return new ResponseEntity<>(roleRepository.save(_role), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity<HttpStatus> deleteTutorial(@PathVariable("id") int id) {
        try {
            roleRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    public ResponseEntity<HttpStatus> deleteAllTutorials() {
        try {
            roleRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
