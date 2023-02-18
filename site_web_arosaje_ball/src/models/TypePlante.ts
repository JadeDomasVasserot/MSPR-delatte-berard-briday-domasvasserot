export default class TypePlante {
  private _id: number;
  private _description: string;
  private _nom: string;


  constructor(id: number, description: string, nom: string) {
    this._id = id;
    this._description = description;
    this._nom = nom;
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

  get nom(): string {
    return this._nom;
  }

  set nom(value: string) {
    this._nom = value;
  }
}
