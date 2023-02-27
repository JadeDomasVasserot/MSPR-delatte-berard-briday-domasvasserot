export default class Role {
  private _id: number;
  private _nom: string;


  constructor(id: number, nom: string) {
    this._id = id;
    this._nom = nom;
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

  set nom(value: string) {
    this._nom = value;
  }
}
