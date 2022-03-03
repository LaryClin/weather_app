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

  @override
  Widget build(BuildContext context){
    return Center(
      child: isLoading
          ? CircularProgressIndicator()
          : villes.isEmpty
          ? Text('Aucune ville') : buildVilles(villes)
    );
     /* Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
          child : const Center(child: Text('Paris')),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          tooltip: 'Supprime la ville',
          onPressed: () {
          },
        ),
      ],
    );*/
  }

  Widget buildVilles(List<Ville> villes){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: villes.map((ville) =>
          SizedBox(
            height: 50,
            child : Center(child: Text(ville.name)),
          ),

        ).toList()
    );
  }
}