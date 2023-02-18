import Personne from "@/models/Personne";
import Plante from "@/models/Plante";

export default class Commentaire {
  private _id: number;
  private _description: string;
  private _photo: string;
  private _titre: string;
  private _auteur: Personne;
  private _plante: Plante;


  constructor(id: number, description: string, photo: string, titre: string, auteur: Personne, plante: Plante) {
    this._id = id;
    this._description = description;
    this._photo = photo;
    this._titre = titre;
    this._auteur = auteur;
    this._plante = plante;
  }


  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get description(): string {
    return this._description;
  }

  set description(value: string) {
    this._description = value;
  }

  get photo(): string {
    return this._photo;
  }

  set photo(value: string) {
    this._photo = value;
  }

  get titre(): string {
    return this._titre;
  }

  set titre(value: string) {
    this._titre = value;
  }

  get auteur(): Personne {
    return this._auteur;
  }

  set auteur(value: Personne) {
    this._auteur = value;
  }

  get plante(): Plante {
    return this._plante;
  }

  set plante(value: Plante) {
    this._plante = value;
  }
}
