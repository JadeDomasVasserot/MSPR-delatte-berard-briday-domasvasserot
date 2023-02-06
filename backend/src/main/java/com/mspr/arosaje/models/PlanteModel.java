package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.Objects;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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


}