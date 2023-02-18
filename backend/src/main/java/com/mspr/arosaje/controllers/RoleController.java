package com.mspr.arosaje.controllers;

import com.mspr.arosaje.models.RoleModel;
import com.mspr.arosaje.repositories.RoleRepository;
import com.mspr.arosaje.repositories.RoleRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {"http://127.0.0.1:8081", "http://127.0.0.1:3000"})
@RequestMapping("/role")
@RestController
@Tag(name = "Role")
public class RoleController {

    @Autowired
    private RoleRepository roleRepository;

    @GetMapping("/all")
    @Operation(summary = "récupère tous les roles")
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
    @Operation(summary = "récupère un role")
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
    @Operation(summary = "ajoute un role")
    public ResponseEntity<RoleModel> createRole(@RequestBody RoleModel role) {
        try {
            RoleModel _roleModel = roleRepository
                    .save(role);
            // rajouter selon les attributs personnalisés
            return new ResponseEntity<>(_roleModel, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/update")
    @Operation(summary = "modifie un role")
    public ResponseEntity<RoleModel> updateRole(@RequestBody RoleModel role) {
        if (role != null) {
            return new ResponseEntity<>(roleRepository.save(role), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/delete/{id}")
    @Operation(summary = "supprime un role")
    public ResponseEntity<HttpStatus> deleteRole(@PathVariable("id") int id) {
        try {
            roleRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping("/all")
    @Operation(summary = "supprime tous les roles")
    public ResponseEntity<HttpStatus> deleteAllRoles() {
        try {
            roleRepository.deleteAll();
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

}
