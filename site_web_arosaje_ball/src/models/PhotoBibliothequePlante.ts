import BibliothequePlante from "@/models/BibliothequePlante";

export default class PhotoBibliothequePlante {
  private id: number;
  private photo: string;
  private bibliothequePlante: BibliothequePlante;


  constructor(id: number, photo: string, bibliothequePlante: BibliothequePlante) {
    this.id = id;
    this.photo = photo;
    this.bibliothequePlante = bibliothequePlante;
  }


  getId(): number {
    return this.id;
  }

  setId(value: number) {
    this.id = value;
  }

  getPhoto(): string {
    return this.photo;
  }

  setPhoto(value: string) {
    this.photo = value;
  }

 getBibliothequePlante(): BibliothequePlante {
    return this.bibliothequePlante;
  }

  setBibliothequePlante(value: BibliothequePlante) {
    this.bibliothequePlante = value;
  }
}
