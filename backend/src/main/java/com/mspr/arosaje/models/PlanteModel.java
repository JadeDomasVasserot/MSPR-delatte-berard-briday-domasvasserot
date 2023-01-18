package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "plante", schema = "arosaje", catalog = "")
public class PlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "nom")
    private String nom;
    @Basic
    @Column(name = "localisation")
    private String localisation;
    @ManyToOne
    @JoinColumn(name = "statut", referencedColumnName = "id", nullable = false)
    private StatutPlanteModel statut;
    @ManyToOne
    @JoinColumn(name = "proprietaire", referencedColumnName = "id", nullable = false)
    private PersonneModel proprietaire;
    @ManyToOne
    @JoinColumn(name = "bibliotheque_plante", referencedColumnName = "id", nullable = false)
    private BibliothequePlanteModel bibliothequePlante;

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

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public StatutPlanteModel getStatut() {
        return statut;
    }

    public void setStatut(StatutPlanteModel statut) {
        this.statut = statut;
    }

    public PersonneModel getProprietaire() {
        return proprietaire;
    }

    public void setProprietaire(PersonneModel proprietaire) {
        this.proprietaire = proprietaire;
    }

    public BibliothequePlanteModel getBibliothequePlante() {
        return bibliothequePlante;
    }

    public void setBibliothequePlante(BibliothequePlanteModel bibliothequePlante) {
        this.bibliothequePlante = bibliothequePlante;
    }
}