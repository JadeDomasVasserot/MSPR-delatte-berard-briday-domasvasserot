import Plante from "@/models/Plante";
import GardePlante from "@/models/GardePlante";
import Personne from "@/models/Personne";

export default class VisitePlante {
   private _id:number;
   private _dateVisite:Date;
   private _photo :string;
   private _gardePlante:GardePlante;
   private _gardien:Personne;
   private _plante: Plante;


  constructor(id: number, dateVisite: Date, photo: string, gardePlante: GardePlante, gardien: Personne, plante: Plante) {
    this._id = id;
    this._dateVisite = dateVisite;
    this._photo = photo;
    this._gardePlante = gardePlante;
    this._gardien = gardien;
    this._plante = plante;
  }

  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get dateVisite(): Date {
    return this._dateVisite;
  }

  set dateVisite(value: Date) {
    this._dateVisite = value;
  }

  get photo(): string {
    return this._photo;
  }

  set photo(value: string) {
    this._photo = value;
  }

  get gardePlante(): GardePlante {
    return this._gardePlante;
  }

  set gardePlante(value: GardePlante) {
    this._gardePlante = value;
  }

  get gardien(): Personne {
    return this._gardien;
  }

  set gardien(value: Personne) {
    this._gardien = value;
  }

  get plante(): Plante {
    return this._plante;
  }

  set plante(value: Plante) {
    this._plante = value;
  }
}
