import Personne from "@/models/Personne";
import Plante from "@/models/Plante";
import StatutPlante from "@/models/StatutPlante";
import PhotoPlante from "@/models/PhotoPlante";

export default class GardePlante {
  private id: number;
  private dateDebut: Date;
  private dateFin: Date;
  private gardien: Personne;
  private plante: Plante;
  private statut: StatutPlante;
  private photo?: PhotoPlante;


  constructor(id: number, dateDebut: Date, dateFin: Date, gardien: Personne, plante: Plante, statut: StatutPlante,photo?: PhotoPlante) {
    this.id = id;
    this.dateDebut = dateDebut;
    this.dateFin = dateFin;
    this.gardien = gardien;
    this.plante = plante;
    this.statut = statut;
    this.photo = photo;
  }

  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

 getDateDebut(): Date {
    return this.dateDebut;
  }

  setDateDebut(value: Date) {
    this.dateDebut = value;
  }

 getDateFin(): Date {
    return this.dateFin;
  }

  setDateFin(value: Date) {
    this.dateFin = value;
  }

 getGardien(): Personne {
    return this.gardien;
  }

  setGardien(value: Personne) {
    this.gardien = value;
  }

  getPlante(): Plante {
    return this.plante;
  }

  setPlante(value: Plante) {
    this.plante = value;
  }

  getStatut(): StatutPlante {
    return this.statut;
  }

  setStatut(value: StatutPlante) {
    this.statut = value;
  }
  getPhoto(): PhotoPlante {
    return <PhotoPlante>this.photo;
  }

  setPhoto(value: PhotoPlante) {
    this.photo = value;
  }
}
