import TypeGuide from "@/models/TypeGuide";
import BibliothequePlante from "@/models/BibliothequePlante";

export default class GuidePlante {
   private _id:number;
   private _description:string;
   private _titre:string;
   private _typeGuide: TypeGuide ;
   private _bibliothequePlante: BibliothequePlante ;


  constructor(id: number, description: string, titre: string, typeGuide: TypeGuide, bibliothequePlante: BibliothequePlante) {
    this._id = id;
    this._description = description;
    this._titre = titre;
    this._typeGuide = typeGuide;
    this._bibliothequePlante = bibliothequePlante;
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

  get titre(): string {
    return this._titre;
  }

  set titre(value: string) {
    this._titre = value;
  }

  get typeGuide(): TypeGuide {
    return this._typeGuide;
  }

  set typeGuide(value: TypeGuide) {
    this._typeGuide = value;
  }

  get bibliothequePlante(): BibliothequePlante {
    return this._bibliothequePlante;
  }

  set bibliothequePlante(value: BibliothequePlante) {
    this._bibliothequePlante = value;
  }
}
