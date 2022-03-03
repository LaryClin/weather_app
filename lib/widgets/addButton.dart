import 'package:flutter/material.dart';

TextEditingController _controller = TextEditingController();

Widget addButton(BuildContext context) {
  _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Ajouter une ville"),
              content: TextField(
                controller: _controller,
              ),
              actions: [
                TextButton(
                  onPressed: () {
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
