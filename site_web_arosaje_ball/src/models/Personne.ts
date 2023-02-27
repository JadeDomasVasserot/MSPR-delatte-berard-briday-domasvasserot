import Role from "@/models/Role";

export default class Personne {
  private _id: number;
  private _adresse: string;
  private _cp: number;
  private _email: string;
  private _mdp: string;
  private _nom: string;
  private _prenom: string;
  private _ville: string;
  private _role: Role;


  constructor(id: number, adresse: string, cp: number, email: string, mdp: string, nom: string, prenom: string, ville: string, role: Role) {
    this._id = id;
    this._adresse = adresse;
    this._cp = cp;
    this._email = email;
    this._mdp = mdp;
    this._nom = nom;
    this._prenom = prenom;
    this._ville = ville;
    this._role = role;
  }


  get id(): number {
    return this._id;
  }

  set id(value: number) {
    this._id = value;
  }

  get adresse(): string {
    return this._adresse;
  }

  set adresse(value: string) {
    this._adresse = value;
  }

  get cp(): number {
    return this._cp;
  }

  set cp(value: number) {
    this._cp = value;
  }

  get email(): string {
    return this._email;
  }

  set email(value: string) {
    this._email = value;
  }

  get mdp(): string {
    return this._mdp;
  }

  set mdp(value: string) {
    this._mdp = value;
  }

  get nom(): string {
    return this._nom;
  }

  set nom(value: string) {
    this._nom = value;
  }

  get prenom(): string {
    return this._prenom;
  }

  set prenom(value: string) {
    this._prenom = value;
  }

  get ville(): string {
    return this._ville;
  }

  set ville(value: string) {
    this._ville = value;
  }

  get role(): Role {
    return this._role;
  }

  set role(value: Role) {
    this._role = value;
  }
}
