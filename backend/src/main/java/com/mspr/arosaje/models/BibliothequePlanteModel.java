package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    @Column(name = "description")
    private String description;
    @ManyToOne
    @JoinColumn(name = "type_plante", referencedColumnName = "id", nullable = false)
    private TypePlanteModel typePlante;


}