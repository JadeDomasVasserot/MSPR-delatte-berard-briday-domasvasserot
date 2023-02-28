import Plante from "@/models/Plante";
import GardePlante from "@/models/GardePlante";
import Personne from "@/models/Personne";
import Commentaire from "@/models/Commentaire";

export default class VisitePlante {
   private id:number;
   private dateVisite:Date;
   private photo :string;
   private gardePlante:GardePlante;
   private gardien:Personne;
   private plante: Plante;
  private commentaire: Commentaire;



  constructor(id: number, dateVisite: Date, photo: string, gardePlante: GardePlante, gardien: Personne, plante: Plante, commentaire: Commentaire) {
    this.id = id;
    this.dateVisite = dateVisite;
    this.photo = photo;
    this.gardePlante = gardePlante;
    this.gardien = gardien;
    this.plante = plante;
    this.commentaire = commentaire;
  }

  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

 getDateVisite(): Date {
    return this.dateVisite;
  }

  setDateVisite(value: Date) {
    this.dateVisite = value;
  }

  getPhoto(): string {
    return this.photo;
  }

  setPhoto(value: string) {
    this.photo = value;
  }

 getGardePlante(): GardePlante {
    return this.gardePlante;
  }

  setGardePlante(value: GardePlante) {
    this.gardePlante = value;
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
  getCommentaire(): Commentaire {
    return this.commentaire;
  }

  setCommentaire(value: Commentaire) {
    this.commentaire = value;
  }
}
