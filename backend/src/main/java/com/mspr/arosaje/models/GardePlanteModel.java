package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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
    @ManyToOne
    @JoinColumn(name = "statut", referencedColumnName = "id", nullable = false)
    private StatutPlanteModel statut;

}