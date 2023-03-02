import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:arosaje/src/models/TypeGuide.dart';
import 'package:arosaje/src/models/BibliothequePlante.dart';
import 'package:arosaje/src/models/GuidePlante.dart';

import 'package:arosaje/src/services/BibliothequePlanteService.dart';
import 'package:arosaje/src/services/guideService.dart';
import 'package:arosaje/src/services/typeGuideService.dart';

import '../components/BottomBarComponent.dart';

class CreateGuideScreen extends StatefulWidget {
  final int id;
  const CreateGuideScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CreateGuideScreen> createState() => _CreateGuideScreen();
}


class _CreateGuideScreen extends State<CreateGuideScreen> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController typeGuideController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String titre;
  late String description;
  late TypeGuide _typeGuide;
  late Future<List<TypeGuide>> _typeGuides;

  @override
  void initState() {
    super.initState();
    _typeGuides = getAllTypeGuide();
    _typeGuides.then((value) {
      if (value.isNotEmpty) {
        _typeGuide = value.first;
      }
    });
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) { 
      try {
        BibliothequePlante bibliothequePlante = await getOneBibliothequePlante(widget.id);
        GuidePlante guide = await addGuide ( titre, description, bibliothequePlante, _typeGuide);
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
        title: const Text('Ajouter un conseil : ',
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
                FutureBuilder<List<TypeGuide>>(
                  future:_typeGuides,
                  builder: (BuildContext context, AsyncSnapshot<List<TypeGuide>> snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: DropdownButtonFormField<TypeGuide>(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.comment),
                            labelText: "Type",
                          ),
                          items: snapshot.data!.map((TypeGuide type) {
                            return DropdownMenuItem<TypeGuide>(
                              value: type,
                              child: Text(type.nom),
                            );
                          }).toList(),
                          onChanged: (TypeGuide? value) {
                            setState(() {
                              _typeGuide = value!;
                            });
                          },
                          value: _typeGuide,
                          isExpanded: true, // ajout de la clé unique
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Une erreur s'est produite : ${snapshot.error}");
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Conseil ajouté'),
                            content: const Text('Conseil bien ajouter'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  context.go("/guide/${widget.id}");
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





