import 'package:arosaje/src/models/Commentaire.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:intl/intl.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';
import 'package:arosaje/src/services/visiteService.dart';
import 'package:arosaje/src/services/commentaireService.dart';

import '../components/BottomBarComponent.dart';

class CreateCommentaireScreen extends StatefulWidget {
  final int id;
  const CreateCommentaireScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CreateCommentaireScreen> createState() => _CreateCommentaireScreen();
}


class _CreateCommentaireScreen extends State<CreateCommentaireScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titreController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String titre;
  late String description;

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) { 
      try {
        GardePlante gardePlante = await getGardePlante(widget.id);
        Commentaire commentaire = await addCommentaire ( titre, description, gardePlante.plante.proprietaire, gardePlante);
      } catch (e) {
        print ('Il y a une erreur quand on valide le formulaire');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255,131,189,117),
        title: const Text('Ajouter un commentaire : ',
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
                    controller: titreController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.comment), 
                      labelText: "Titre" 
                    ),
                    onChanged: (value) {
                      titre = value;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.comment), 
                      labelText: "Commentaire" 
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      description = value;
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
                            title: const Text('Commentaire ajouté'),
                            content: const Text('Commentaire bien ajouter'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  context.go("/plante/${widget.id}");
                                },
                                child: const Text('OK'),
                              ),
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





