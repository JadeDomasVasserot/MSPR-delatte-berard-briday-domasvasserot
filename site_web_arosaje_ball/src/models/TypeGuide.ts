export default class TypeGuide {
   private id:number;
   private nom:string;


  constructor(id: number, nom: string) {
    this.id = id;
    this.nom = nom;
  }

  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

  getNom(): string {
    return this.nom;
  }

  setNom(value: string) {
    this.nom = value;
  }
}
