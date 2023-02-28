import Personne from "@/models/Personne";
import Plante from "@/models/Plante";

export default class Commentaire {
  private id: number;
  private description: string;
  private photo: string;
  private titre: string;
  private auteur: Personne;
  private plante: Plante;


  constructor(id: number, description: string, photo: string, titre: string, auteur: Personne, plante: Plante) {
    this.id = id;
    this.description = description;
    this.photo = photo;
    this.titre = titre;
    this.auteur = auteur;
    this.plante = plante;
  }


  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

 getDescription(): string {
    return this.description;
  }

  setDescription(value: string) {
    this.description = value;
  }

  getPhoto(): string {
    return this.photo;
  }

  setPhoto(value: string) {
    this.photo = value;
  }

 getTitre(): string {
    return this.titre;
  }

 setTitre(value: string) {
    this.titre = value;
  }

 getAuteur(): Personne {
    return this.auteur;
  }

 setAuteur(value: Personne) {
    this.auteur = value;
  }

  getPlante(): Plante {
    return this.plante;
  }

  setPlante(value: Plante) {
    this.plante = value;
  }
}
