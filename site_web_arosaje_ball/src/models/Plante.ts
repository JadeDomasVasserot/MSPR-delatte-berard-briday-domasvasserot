import StatutPlante from "@/models/StatutPlante";
import Personne from "@/models/Personne";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoPlante from "@/models/PhotoPlante";

export default class Plante {

  private _id: number;
  private _localisation: string;
  private _bibliothequePlante: BibliothequePlante;
  private _proprietaire: Personne;
  private _statut: StatutPlante;
  private _photo?: PhotoPlante;


  constructor(id: number, localisation: string, bibliothequePlante: BibliothequePlante, proprietaire: Personne, statut: StatutPlante, photo?: PhotoPlante) {
    this._id = id;
    this._localisation = localisation;
    this._bibliothequePlante = bibliothequePlante;
    this._proprietaire = proprietaire;
    this._statut = statut;
    this._photo = photo;
  }


  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }


  get localisation(): string {
    return this._localisation;
  }

  set localisation(value: string) {
    this._localisation = value;
  }

  get bibliothequePlante(): BibliothequePlante {
    return this._bibliothequePlante;
  }

  set bibliothequePlante(value: BibliothequePlante) {
    this._bibliothequePlante = value;
  }

  get proprietaire(): Personne {
    return this._proprietaire;
  }

  set proprietaire(value: Personne) {
    this._proprietaire = value;
  }

  get statut(): StatutPlante {
    return this._statut;
  }

  set statut(value: StatutPlante) {
    this._statut = value;
  }
  get photo(): PhotoPlante {
    return <PhotoPlante>this._photo;
  }

  set photo(value: PhotoPlante) {
    this._photo = value;
  }
}
