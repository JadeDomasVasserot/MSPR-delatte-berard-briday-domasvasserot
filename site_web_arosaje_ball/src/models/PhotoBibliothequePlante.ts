import BibliothequePlante from "@/models/BibliothequePlante";

export default class PhotoBibliothequePlante {
  private _id: number;
  private _photo: string;
  private _bibliothequePlante: BibliothequePlante;


  constructor(id: number, photo: string, bibliothequePlante: BibliothequePlante) {
    this._id = id;
    this._photo = photo;
    this._bibliothequePlante = bibliothequePlante;
  }


  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get photo(): string {
    return this._photo;
  }

  set photo(value: string) {
    this._photo = value;
  }

  get bibliothequePlante(): BibliothequePlante {
    return this._bibliothequePlante;
  }

  set bibliothequePlante(value: BibliothequePlante) {
    this._bibliothequePlante = value;
  }
}
