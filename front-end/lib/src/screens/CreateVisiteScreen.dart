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

class CreateVisiteScreen extends StatefulWidget {
  final int id;
  const CreateVisiteScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CreateVisiteScreen> createState() => _CreateVisiteScreen();
}


class _CreateVisiteScreen extends State<CreateVisiteScreen> {
  TextEditingController dateVisiteController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titreController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late DateTime dateVisite;
  late String titre;
  late String description;

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) { 
      try {
        GardePlante gardePlante = await getGardePlante(widget.id);
        Commentaire commentaire = await addCommentaire ( titre, description, gardePlante.plante.proprietaire, gardePlante);
        VisitePlante visite =
            await addVisite (gardePlante.gardien!, dateVisite, gardePlante.plante , gardePlante, commentaire );
      } catch (e) {
        print (e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.go("/profile");
            }, 
          )
        ],
        backgroundColor: const Color.fromARGB(255,131,189,117),
        title: const Text('Ajouter visite : ',
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
                  child: TextField(
                    controller: dateVisiteController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.calendar_today), 
                      labelText: "Date de la visite" 
                    ),
                    readOnly: true,  
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), 
                        firstDate:DateTime.now(), 
                        lastDate: DateTime(2101)
                      );
                      if(pickedDate != null ){
                        print(pickedDate);  
                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); 
                        print(formattedDate); 

                        setState(() {
                          dateVisite= pickedDate;
                          dateVisiteController.text = formattedDate; 
                        });
                      }else{
                          print("Date is not selected");
                      }
                    }
                  )
                ),
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
                            title: const Text('Visite ajouté'),
                            content: const Text('Voullez vous ajouter une photo'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  context.go("/camera");
                                },
                                child: const Text('OUI'),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.go("/garde");
                                },
                                child: const Text('NON'),
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





