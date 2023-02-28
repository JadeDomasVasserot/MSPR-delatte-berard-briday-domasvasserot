import Role from "@/models/Role";

export default class Personne {
  private id: number;
  private adresse: string;
  private cp: number;
  private email: string;
  private mdp: string;
  private nom: string;
  private prenom: string;
  private ville: string;
  private role: Role;


  constructor(id: number, adresse: string, cp: number, email: string, mdp: string, nom: string, prenom: string, ville: string, role: Role) {
    this.id = id;
    this.adresse = adresse;
    this.cp = cp;
    this.email = email;
    this.mdp = mdp;
    this.nom = nom;
    this.prenom = prenom;
    this.ville = ville;
    this.role = role;
  }


  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

 getAdresse(): string {
    return this.adresse;
  }

 setAdresse(value: string) {
    this.adresse = value;
  }

  getCp(): number {
    return this.cp;
  }

  setCp(value: number) {
    this.cp = value;
  }

  getEmail(): string {
    return this.email;
  }

  setEmail(value: string) {
    this.email = value;
  }

  getMdp(): string {
    return this.mdp;
  }

  setMdp(value: string) {
    this.mdp = value;
  }

  getNom(): string {
    return this.nom;
  }

  setNom(value: string) {
    this.nom = value;
  }

  getPrenom(): string {
    return this.prenom;
  }

  setPrenom(value: string) {
    this.prenom = value;
  }

  getVille(): string {
    return this.ville;
  }

  setVille(value: string) {
    this.ville = value;
  }

  getRole(): Role {
    return this.role;
  }

  setRole(value: Role) {
    this.role = value;
  }
}
