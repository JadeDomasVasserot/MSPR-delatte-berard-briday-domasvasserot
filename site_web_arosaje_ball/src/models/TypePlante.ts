export default class TypePlante {
  private id: number;
  private description: string;
  private nom: string;


  constructor(id: number, description: string, nom: string) {
    this.id = id;
    this.description = description;
    this.nom = nom;
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

  getNom(): string {
    return this.nom;
  }

  setNom(value: string) {
    this.nom = value;
  }
}
