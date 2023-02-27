import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/models/StatutPlante.dart';
import 'package:arosaje/src/models/GardePlante.dart';
import 'package:intl/intl.dart';
import 'package:arosaje/src/services/gardePlanteService.dart';
import 'package:arosaje/src/services/planteService.dart';
import 'package:arosaje/src/services/statutService.dart';

import '../components/BottomBarComponent.dart';

class CreateGardeScreen extends StatefulWidget {
  final int id;
  const CreateGardeScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CreateGardeScreen> createState() => _CreateGardeScreen();
}


class _CreateGardeScreen extends State<CreateGardeScreen> {
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _planteController = TextEditingController();
  late DateTime _dateDebut;
  late DateTime _dateFin;

  void _submitForm() async {
  if (_formKey.currentState?.validate() ?? false) { 
    try {
      Plante plante = await getPlante(widget.id);
      StatutPlante statut = await getStatutPlante(2);
      plante = await updatePlante(plante.id, plante.localisation, statut, plante.proprietaire, plante.bibliothequePlante);
      GardePlante gardePlante =
          await addGardePlante(plante, _dateDebut, _dateFin);  
    } catch (e) {
      print ('Il y a une erreur quand on valide le formulaire');
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
        title: const Text('Créer une garde : ',
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
                    controller: dateDebutController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.calendar_today), 
                      labelText: "Date de début" 
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
                          _dateDebut = pickedDate;
                          dateDebutController.text = formattedDate; 
                        });
                      }else{
                          print("Date is not selected");
                      }
                    }
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: dateFinController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.calendar_today), 
                      labelText: "Date de fin" 
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
                          _dateFin = pickedDate;
                          dateFinController.text = formattedDate; 
                        });
                      }else{
                          print("Date is not selected");
                      }
                    }
                  )
                ),
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Garde ajouté'),
                            content: const Text('Votre garde à bien été ajouté'),
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





