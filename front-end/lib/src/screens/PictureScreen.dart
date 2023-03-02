import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:arosaje/src/models/VisitePlante.dart';
import 'package:arosaje/src/services/visiteService.dart';

import '../components/BottomBarComponent.dart';
import '../models/PhotoPlante.dart';
import '../models/Plante.dart';

class PictureScreen extends StatefulWidget {
  final int id;
  const PictureScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<PictureScreen> createState() => _PictureScreen();
}

class _PictureScreen extends State<PictureScreen> {

  ImagePicker picker = ImagePicker();
  XFile? imageSelected;
  PhotoPlante? photoPlante;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VisitePlante>(
      future: getVisite(widget.id), // Mettre ID session 
      builder: (BuildContext context, AsyncSnapshot<VisitePlante> snapshot) {
        if (snapshot.hasData) {
          final VisitePlante visite = snapshot.data! ;
          return MaterialApp(
            title: 'Arosaje',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Photo : ',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )
                ),
                backgroundColor: const Color.fromARGB(255,131,189,117),
              ),
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
                        text: 'Plante : ${photoPlante != null ? photoPlante!.plante?.bibliothequePlante.nom : 'Unknown'}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black)
                          ),
                          TextSpan(
                            text: photoPlante != null ? '\nPropriétaire : ${photoPlante!.plante?.proprietaire.nom}, ${photoPlante!.plante?.proprietaire.prenom}, (${photoPlante!.plante?.proprietaire.ville.toUpperCase()})' : '\nPropriétaire : Unknown (UNKNOWN)',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                          ),
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
                            context.go("/camera");
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
                            // updateVisite (visite.gardien,visite.dateVisite, visite.plante, visite.gardePlante, visite.commentaire, imageSelected)
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
            )
          );
        }else if (snapshot.hasError) {
          return Text("Une erreur s'est produite : ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        } 
      }
    );
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
