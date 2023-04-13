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
@Table(name = "guide_plante", schema = "arosaje", catalog = "")
public class GuidePlanteModel {
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
    @JoinColumn(name = "bibliotheque_plante", referencedColumnName = "id", nullable = false)
    private BibliothequePlanteModel bibliothequePlante;
    @ManyToOne
    @JoinColumn(name = "type_guide", referencedColumnName = "id", nullable = false)
    private TypeGuideModel typeGuide;

}