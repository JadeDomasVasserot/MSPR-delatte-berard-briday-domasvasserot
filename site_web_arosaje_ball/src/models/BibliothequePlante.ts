import GuidePlante from "@/models/GuidePlante";
import TypePlante from "@/models/TypePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";

export default class BibliothequePlante {
  private _id: number;
  private _nom: string;
  private _description: string;
  private _typePlante: TypePlante;
  private _photo?: PhotoBibliothequePlante;


  constructor(id: number, nom: string,  description: string, typePlante: TypePlante, photo?: PhotoBibliothequePlante) {
    this._id = id;
    this._nom = nom;
    this._description = description;
    this._typePlante = typePlante;
    this._photo = photo;
  }


  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get nom(): string {
    return this._nom;
  }

  set nom(value:  string) {
    this._nom = value;
  }


  get description(): string {
    return this._description;
  }

  set description(value: string) {
    this._description = value;
  }


  get typePlante(): TypePlante {
    return this._typePlante;
  }

  set typePlante(value: TypePlante) {
    this._typePlante = value;
  }

  get photo(): PhotoBibliothequePlante {
    return <PhotoBibliothequePlante>this._photo;
  }

  set photo(value: PhotoBibliothequePlante) {
    this._photo = value;
  }
}
