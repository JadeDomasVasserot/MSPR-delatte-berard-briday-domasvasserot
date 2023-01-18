package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "photo_bibliotheque_plante", schema = "arosaje", catalog = "")
public class PhotoBibliothequePlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "photo")
    private String photo;
    @ManyToOne
    @JoinColumn(name = "bibliotheque_plante", referencedColumnName = "id", nullable = false)
    private BibliothequePlanteModel bibliothequePlante;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public BibliothequePlanteModel getBibliothequePlante() {
        return bibliothequePlante;
    }

    public void setBibliothequePlante(BibliothequePlanteModel bibliothequePlante) {
        this.bibliothequePlante = bibliothequePlante;
    }
}