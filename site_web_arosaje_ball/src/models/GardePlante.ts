import Personne from "@/models/Personne";
import Plante from "@/models/Plante";

export default class GardePlante {
  private _id: number;
  private _dateDebut: Date;
  private _dateFin: Date;
  private _gardien: Personne;
  private _plante: Plante;


  constructor(id: number, dateDebut: Date, dateFin: Date, gardien: Personne, plante: Plante) {
    this._id = id;
    this._dateDebut = dateDebut;
    this._dateFin = dateFin;
    this._gardien = gardien;
    this._plante = plante;
  }

  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get dateDebut(): Date {
    return this._dateDebut;
  }

  set dateDebut(value: Date) {
    this._dateDebut = value;
  }

  get dateFin(): Date {
    return this._dateFin;
  }

  set dateFin(value: Date) {
    this._dateFin = value;
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
