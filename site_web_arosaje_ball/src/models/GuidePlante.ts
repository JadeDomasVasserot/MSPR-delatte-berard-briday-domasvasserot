import TypeGuide from "@/models/TypeGuide";
import BibliothequePlante from "@/models/BibliothequePlante";

export default class GuidePlante {
   private id:number;
   private description:string;
   private titre:string;
   private typeGuide: TypeGuide ;
   private bibliothequePlante: BibliothequePlante ;


  constructor(id: number, description: string, titre: string, typeGuide: TypeGuide, bibliothequePlante: BibliothequePlante) {
    this.id = id;
    this.description = description;
    this.titre = titre;
    this.typeGuide = typeGuide;
    this.bibliothequePlante = bibliothequePlante;
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

 getTypeGuide(): TypeGuide {
    return this.typeGuide;
  }

 setTypeGuide(value: TypeGuide) {
    this.typeGuide = value;
  }

 getBibliothequePlante(): BibliothequePlante {
    return this.bibliothequePlante;
  }

  setBibliothequePlante(value: BibliothequePlante) {
    this.bibliothequePlante = value;
  }
}
