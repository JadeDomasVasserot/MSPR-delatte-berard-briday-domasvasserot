package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "bibliotheque_plante", schema = "arosaje", catalog = "")
public class BibliothequePlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "nom")
    private String nom;
    @ManyToOne
    @JoinColumn(name = "type_plante", referencedColumnName = "id", nullable = false)
    private TypePlanteModel typePlante;
    @ManyToOne
    @JoinColumn(name = "guide_plante", referencedColumnName = "id", nullable = false)
    private GuidePlanteModel guidePlante;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public TypePlanteModel getTypePlante() {
        return typePlante;
    }

    public void setTypePlante(TypePlanteModel typePlante) {
        this.typePlante = typePlante;
    }

    public GuidePlanteModel getGuidePlante() {
        return guidePlante;
    }

    public void setGuidePlante(GuidePlanteModel guidePlante) {
        this.guidePlante = guidePlante;
    }
}