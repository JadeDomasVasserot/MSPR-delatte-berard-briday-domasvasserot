import StatutPlante from "@/models/StatutPlante";
import Personne from "@/models/Personne";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoPlante from "@/models/PhotoPlante";

export default class Plante {

  private id: number;
  private localisation: string;
  private bibliothequePlante: BibliothequePlante;
  private proprietaire: Personne;
  private photo?: PhotoPlante;


  constructor(id: number, localisation: string, bibliothequePlante: BibliothequePlante, proprietaire: Personne, photo?: PhotoPlante) {
    this.id = id;
    this.localisation = localisation;
    this.bibliothequePlante = bibliothequePlante;
    this.proprietaire = proprietaire;
    this.photo = photo;
  }


  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }


 getLocalisation(): string {
    return this.localisation;
  }

  setLocalisation(value: string) {
    this.localisation = value;
  }

 getBibliothequePlante(): BibliothequePlante {
    return this.bibliothequePlante;
  }

  setBibliothequePlante(value: BibliothequePlante) {
    this.bibliothequePlante = value;
  }

  getProprietaire(): Personne {
    return this.proprietaire;
  }

  setProprietaire(value: Personne) {
    this.proprietaire = value;
  }

  getPhoto(): PhotoPlante {
    return <PhotoPlante>this.photo;
  }

  setPhoto(value: PhotoPlante) {
    this.photo = value;
  }
}
