package com.mspr.arosaje.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
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

}