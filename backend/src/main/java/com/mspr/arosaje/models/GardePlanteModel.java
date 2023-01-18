package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "garde_plante", schema = "arosaje", catalog = "")
public class GardePlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @ManyToOne
    @JoinColumn(name = "plante", referencedColumnName = "id", nullable = false)
    private PlanteModel plante;
    @Basic
    @Column(name = "date_debut")
    private Date dateDebut;
    @Basic
    @Column(name = "date_fin")
    private Date dateFin;
    @ManyToOne
    @JoinColumn(name = "gardien", referencedColumnName = "id")
    private PersonneModel gardien;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PlanteModel getPlante() {
        return plante;
    }

    public void setPlante(PlanteModel plante) {
        this.plante = plante;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public PersonneModel getGardien() {
        return gardien;
    }

    public void setGardien(PersonneModel gardien) {
        this.gardien = gardien;
    }
}