import 'package:arosaje/src/components/BottomBarComponent.dart';
import 'package:arosaje/src/models/Plante.dart';
import 'package:arosaje/src/services/photoPlanteService.dart';
import 'package:arosaje/src/services/planteService.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> {
  late Future<List<Plante>> futurePlante;
  @override
  void initState() {
    super.initState();
    futurePlante = getAllPlantes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [BackButton(onPressed: () => "/", color: Colors.white)],
        backgroundColor: Colors.green,
        title: const Text('Les plantes à garder',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
          )
      ),
      body: Center(
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255,204,214, 166),
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom : 4),
                              child: const Text('Ma petite plante',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Expanded(
                                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top : 4),
                              padding: const EdgeInsets.only(top : 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Du : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('25/02',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text(' au ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('01/03',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              child : Row (children: [
                                Container(
                                  child: const Text('A : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('Lyon, 69009',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255,204,214, 166),
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom : 4),
                              child: const Text('Ma petite plante',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Expanded(
                                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top : 4),
                              padding: const EdgeInsets.only(top : 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Du : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('25/02',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text(' au ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('01/03',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              child : Row (children: [
                                Container(
                                  child: const Text('A : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('Lyon, 69009',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255,204,214, 166),
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom : 4),
                              child: const Text('Ma petite plante',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Expanded(
                                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top : 4),
                              padding: const EdgeInsets.only(top : 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Du : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('25/02',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text(' au ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('01/03',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              child : Row (children: [
                                Container(
                                  child: const Text('A : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('Lyon, 69009',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255,204,214, 166),
                        border: Border.all(),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom : 4),
                              child: const Text('Ma petite plante',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black
                                )
                              )
                            ),
                            Container(
                              child: Expanded(
                                child :Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg')
                              )
                            ),
                            Container(
                              margin: const EdgeInsets.only(top : 4),
                              padding: const EdgeInsets.only(top : 2),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top : BorderSide()
                                )
                              ),
                              child : Row (children: [
                                Container(
                                  child: const Text('Du : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('25/02',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text(' au ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('01/03',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                )
                              ],)
                            ),
                            Container(
                              child : Row (children: [
                                Container(
                                  child: const Text('A : ',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                                Container(
                                  child: const Text('Lyon, 69009',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15,
                                      color: Colors.black
                                    )
                                  )
                                ),
                              ],)
                            ),
                          ]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: const BottomBarComponent()
    );
  }
}



// class _HomeScreen extends State<HomeScreen> {
//   late Future<List<Plante>> futurePlante;
//   @override
//   void initState() {
//     super.initState();
//     futurePlante = getAllPlantes();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//          actions: [BackButton(onPressed: () => "/", color: Colors.white)],
//           backgroundColor: Colors.green
//         ),
//         body: Center(
//           child: FutureBuilder<List<Plante>>(
//             future: futurePlante,
//             builder: (context, snapshot) {
//               if (snapshot.data != null) {
//                return Plante.getListPlantes(snapshot.requireData);
//               }
//               else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//         bottomNavigationBar: const BottomBarComponent()
//     );
//   }
// }