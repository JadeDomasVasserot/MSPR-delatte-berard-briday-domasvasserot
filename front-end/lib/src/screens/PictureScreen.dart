import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../components/BottomBarComponent.dart';
import '../models/PhotoPlante.dart';
import '../models/Plante.dart';

class PictureScreen extends StatefulWidget {
  const PictureScreen({Key? key}) : super(key: key);

  @override
  State<PictureScreen> createState() => _PictureScreen();
}

class _PictureScreen extends State<PictureScreen> {

  ImagePicker picker = ImagePicker();
  XFile? imageSelected;
  PhotoPlante? photoPlante;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Arosaje',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage(photoPlante != null ? photoPlante!.photo : "https://img.freepik.com/premium-vector/cartoon-illustration-tomatoes-with-question-mark_152558-37149.jpg"),
                    height: 250,
                    width: 250,
                  ),
                  RichText(
                      text: TextSpan(
                        text: 'Plante : ${photoPlante != null ? photoPlante!.plante?.nom : 'Unknown'}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '\nStatus : ${photoPlante != null ? photoPlante!.plante?.statut.nom : 'no status'}',
                              style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black)),
                          TextSpan(
                              text: photoPlante != null ? '\nPropriétaire : ${photoPlante!.plante?.proprietaire.nom}, ${photoPlante!.plante?.proprietaire.prenom}, (${photoPlante!.plante?.proprietaire.ville.toUpperCase()})' : '\nPropriétaire : Unknown (UNKNOWN)',
                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          context.go("/cam");
                        },
                        child: const Text("+ Prendre une photo", style: TextStyle(color: Colors.blue),),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () async {
                          imageSelected = await picker.pickImage(source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: const Text("+ Ajouter une photo", style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                  _showImageSelected()
                ],
              ),
            ),
            bottomNavigationBar: const BottomBarComponent()
        ));
  }

  Widget _showImageSelected() {
    if (imageSelected != null) {
      return Image(
          image: XFileImage(imageSelected!)
      );
    } else {
      return Container();
    }
  }
}
