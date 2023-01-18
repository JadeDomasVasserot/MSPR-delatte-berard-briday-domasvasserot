package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "commentaire", schema = "arosaje", catalog = "")
public class CommentaireModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "titre")
    private String titre;
    @Basic
    @Column(name = "description")
    private String description;
    @ManyToOne
    @JoinColumn(name = "auteur", referencedColumnName = "id", nullable = false)
    private PersonneModel auteur;
    @Basic
    @Column(name = "photo")
    private String photo;
    @ManyToOne
    @JoinColumn(name = "plante", referencedColumnName = "id", nullable = false)
    private PlanteModel plante;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PersonneModel getAuteur() {
        return auteur;
    }

    public void setAuteur(PersonneModel auteur) {
        this.auteur = auteur;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public PlanteModel getPlante() {
        return plante;
    }

    public void setPlante(PlanteModel plante) {
        this.plante = plante;
    }
}