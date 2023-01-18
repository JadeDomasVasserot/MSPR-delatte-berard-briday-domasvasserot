package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "visite_plante", schema = "arosaje", catalog = "")
public class VisitePlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "photo")
    private String photo;
    @ManyToOne
    @JoinColumn(name = "gardien", referencedColumnName = "id", nullable = false)
    private PersonneModel gardien;
    @Basic
    @Column(name = "date_visite")
    private Date dateVisite;
    @ManyToOne
    @JoinColumn(name = "plante", referencedColumnName = "id", nullable = false)
    private PlanteModel plante;
    @ManyToOne
    @JoinColumn(name = "garde_plante", referencedColumnName = "id", nullable = false)
    private GardePlanteModel gardePlante;

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

    public PersonneModel getGardien() {
        return gardien;
    }

    public void setGardien(PersonneModel gardien) {
        this.gardien = gardien;
    }

    public Date getDateVisite() {
        return dateVisite;
    }

    public void setDateVisite(Date dateVisite) {
        this.dateVisite = dateVisite;
    }

    public PlanteModel getPlante() {
        return plante;
    }

    public void setPlante(PlanteModel plante) {
        this.plante = plante;
    }

    public GardePlanteModel getGardePlante() {
        return gardePlante;
    }

    public void setGardePlante(GardePlanteModel gardePlante) {
        this.gardePlante = gardePlante;
    }
}
