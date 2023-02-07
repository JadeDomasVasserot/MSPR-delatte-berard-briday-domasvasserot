package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "commentaire", schema = "arosaje", catalog = "")
public class CommentaireModel {
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
    @JoinColumn(name = "auteur", referencedColumnName = "id", nullable = false)
    private PersonneModel auteur;
    @Basic
    @Column(name = "photo")
    private String photo;
    @ManyToOne
    @JoinColumn(name = "plante", referencedColumnName = "id", nullable = false)
    private PlanteModel plante;


}