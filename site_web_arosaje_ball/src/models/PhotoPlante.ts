import Plante from "@/models/Plante";

export default class PhotoPlante {
  private _id: number;
  private _photo: string;
  private _plante: Plante;


  constructor(id: number, photo: string, plante: Plante) {
    this._id = id;
    this._photo = photo;
    this._plante = plante;
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

  get plante(): Plante {
    return this._plante;
  }

  set plante(value: Plante) {
    this._plante = value;
  }
}
