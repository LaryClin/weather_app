import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/db/VillesDatabase.dart';
import 'package:weather_app/widgets/addButton.dart';
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
                    },
                    child: const Text("Ok"),
                  )
                ]);
          });
    }

    /*return Row(
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
    );*/

       return ListView.builder(
            itemCount: villes.length + 1,
            itemBuilder: (BuildContext context, int i){
              if(i == 0){
                return MyAddButton(context);
              }else{
              return Center(
                  child:ListTile(
                    leading:TextButton(onPressed: () {}, child: Text(villes[i - 1].name)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                        onPressed: () {
                          _showMyDeleteDialog();
                          //VillesDatabase.delete(villes[i - 1].id)
                        },
                    ),
                  )
              );}
            }
         );
  }

  /*Future deleteVille(id, name) async {
    final ville = Ville(
        id?: id,
        name: name
    );
    print(id);
    await VillesDatabase.instance.delete(ville.id);
    print('ok');
  }*/

}
