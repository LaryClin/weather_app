import 'package:flutter/material.dart';

import '../db/VillesDatabase.dart';
import '../models/ville.dart';

// Add form widget
class MyAddButton extends StatefulWidget {
  const MyAddButton(BuildContext context, {Key? key}) : super(key: key);

  @override
  _MyAddButton createState() => _MyAddButton();
}

class _MyAddButton extends State<MyAddButton> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _showMyDialog() async {
      return showDialog<void>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return AlertDialog(
                title: const Text("Ajouter une ville"),
                content: TextField(
                  controller: myController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      addVille(myController.text);
                      Navigator.pop(context);
                    },
                    child: const Text("Valider"),
                  )
                ]);
          });
    }

    return Column(
      children: <Widget>[
        const SizedBox(height: 50),
        const Text(
          "Mes villes",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          child: const Text("Ajouter une ville"),
          onPressed: () {
            _showMyDialog();
            //Navigator.pop(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => Todo(idTodo: idTodo,)));
          },
        )
      ],
    );
  }

  Future addVille(name) async {
    final ville = Ville(
        name: name
    );
    print(name);
    await VillesDatabase.instance.create(ville);
    print('ok');
  }
}
