import Personne from "@/models/Personne";
import GardePlante from "@/models/GardePlante";

export default class Commentaire {
  private id: number;
  private description: string;
  private titre: string;
  private auteur: Personne;
  private gardePlante: GardePlante;


  constructor(id: number, description: string, titre: string, auteur: Personne, gardePlante: GardePlante) {
    this.id = id;
    this.description = description;
    this.titre = titre;
    this.auteur = auteur;
    this.gardePlante = gardePlante;
  }


  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

 getDescription(): string {
    return this.description;
  }

  setDescription(value: string) {
    this.description = value;
  }

 getTitre(): string {
    return this.titre;
  }

 setTitre(value: string) {
    this.titre = value;
  }

 getAuteur(): Personne {
    return this.auteur;
  }

 setAuteur(value: Personne) {
    this.auteur = value;
  }

  getGardePlante(): GardePlante {
    return this.gardePlante;
  }

  setGardePlante(value: GardePlante) {
    this.gardePlante = value;
  }
}
