import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/db/VillesDatabase.dart';
import '../models/ville.dart';

class VillesList extends StatefulWidget {
  @override
  _VillesPageState createState() => _VillesPageState();
}

class _VillesPageState extends State<VillesList> {
  late List<Ville> villes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshVilles();
  }

  @override
  void dispose() {
    VillesDatabase.instance.close();
    super.dispose();
  }

  Future refreshVilles() async {
    setState(() => isLoading = true);

    this.villes = await VillesDatabase.instance.readAllVilles();

    setState(() => isLoading = false);
  }

  /*Future addNote() async {
    final note = Ville(
      id: id,
      name:name,
    );

    await VillesDatabase.instance.create(note);
  }*/


  @override
  Widget build(BuildContext context){
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : villes.isEmpty
          ? Text('Aucune ville') : buildVilles(villes)
    );
  }

  Widget buildVilles(List<Ville> villes){

    _showMyDeleteDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("La ville a bien été supprimé"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      create(context)
                    },
                    child: const Text("Ok"),
                  )
                ]);
          });
    }

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: villes.map((ville) =>
            SizedBox(
              height: 50,
              child : Center(
                  child: ListTile(
                    leading:
                    TextButton(onPressed: () {}, child: Text('Hola chicas')),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _showMyDeleteDialog();
                      },
                    ),
                  )
              ),
            ),

        ).toList()
    );
  }
}
