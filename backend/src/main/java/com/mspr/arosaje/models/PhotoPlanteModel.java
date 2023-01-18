package com.mspr.arosaje.models;

import jakarta.persistence.*;

import java.util.Objects;

@Entity
@Table(name = "photoplante", schema = "arosaje", catalog = "")
public class PhotoPlanteModel {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
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