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

}