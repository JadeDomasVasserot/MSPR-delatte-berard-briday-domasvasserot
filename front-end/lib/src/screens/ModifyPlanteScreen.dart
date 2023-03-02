import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/planteService.dart';

import '../components/BottomBarComponent.dart';

class ModifyPlanteScreen extends StatefulWidget {
  final int id;
  const ModifyPlanteScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<ModifyPlanteScreen> createState() => _ModifyPlanteScreen();
}


class _ModifyPlanteScreen extends State<ModifyPlanteScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _localisationController = TextEditingController();

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        Plante plante = await getPlante(widget.id);
        Plante updatedPlante = await updatePlante(plante.id, _localisationController.text, plante.proprietaire, plante.bibliothequePlante);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Plante mise à jour avec succès')));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erreur lors de la mise à jour de la plante')));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,131,189,117),
        title: const Text('Modifier ma plante',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          elevation: 0,
          color: const Color.fromARGB(100, 233,239, 192),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(
              color: Color.fromARGB(255, 233,239, 192),
            )
          ),
          child : Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _localisationController,
                    decoration: const InputDecoration(labelText: 'Localisation'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Le champ localisation est obligatoire';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Modifier plante'),
                            content: const Text('Votre plante à bien été modifié'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  context.go("/my_plante/${widget.id}");
                                },
                                child: const Text('OK'),
                              )
                            ]
                          )
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black)
                      )
                    ),
                    child: const Text('Valider',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 15,
                        color: Colors.black
                      )
                    ),
                  )
                ),
                Spacer(),
              ],
            ),
          )
        )
      ),
      bottomNavigationBar: const BottomBarComponent()
    );
  }
}


