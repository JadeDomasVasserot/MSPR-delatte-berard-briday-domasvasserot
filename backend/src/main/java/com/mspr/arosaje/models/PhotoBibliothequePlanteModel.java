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


}