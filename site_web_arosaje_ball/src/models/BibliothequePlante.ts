import GuidePlante from "@/models/GuidePlante";
import TypePlante from "@/models/TypePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";

export default class BibliothequePlante {
  private id: number;
  private nom: string;
  private description: string;
  private typePlante: TypePlante;
  private photo?: PhotoBibliothequePlante;


  constructor(id: number, nom: string,  description: string, typePlante: TypePlante, photo?: PhotoBibliothequePlante) {
    this.id = id;
    this.nom = nom;
    this.description = description;
    this.typePlante = typePlante;
    this.photo = photo;
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

  setNom(value:  string) {
    this.nom = value;
  }


 getDescription(): string {
    return this.description;
  }

  setDescription(value: string) {
    this.description = value;
  }


 getTypePlante(): TypePlante {
    return this.typePlante;
  }

 setTypePlante(value: TypePlante) {
    this.typePlante = value;
  }

  getPhoto(): PhotoBibliothequePlante {
    return <PhotoBibliothequePlante>this.photo;
  }

  setPhoto(value: PhotoBibliothequePlante) {
    this.photo = value;
  }
}
