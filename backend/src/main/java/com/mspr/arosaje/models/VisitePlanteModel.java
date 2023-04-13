package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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
    @ManyToOne
    @JoinColumn(name = "commentaire", referencedColumnName = "id", nullable = false)
    private CommentaireModel commentaire;

}
