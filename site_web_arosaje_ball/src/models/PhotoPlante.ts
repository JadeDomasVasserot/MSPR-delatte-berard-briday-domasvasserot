import Plante from "@/models/Plante";

export default class PhotoPlante {
  private id: number;
  private photo: string;
  private plante: Plante;


  constructor(id: number, photo: string, plante: Plante) {
    this.id = id;
    this.photo = photo;
    this.plante = plante;
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

  getPlante(): Plante {
    return this.plante;
  }

  setPlante(value: Plante) {
    this.plante = value;
  }
}
