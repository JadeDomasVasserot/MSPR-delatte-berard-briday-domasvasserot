import axios, { AxiosResponse } from 'axios';
import Plante from "@/models/Plante";
import {types} from "sass";

export const PlanteService = {
  getAllPlantes(): Promise<Plante[]> {
    return new Promise((resolve, reject) => {
      axios.post("https://localhost:9000/plante/all", { withCredentials: true })
        .then((response: AxiosResponse) => {
          let planteItem;
          if (response.data) {
            let plantesTab = [];
            for (let plante in response.data) {
              planteItem = new Plante(response.data[plante].id, response.data[plante].nom, response.data[plante].localisation, response.data[plante].bibliothequeresponse.data[plante], response.data[plante].proprietaire, response.data[plante].statut)
              plantesTab.push(planteItem)
            }
            resolve('purge OK');
          } else {
            reject();
          }
        }).catch(() => {
        reject('unexpected error');
      });
    });
  },
};
