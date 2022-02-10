import 'package:flutter/material.dart';

Widget addButton(BuildContext context){
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
              //Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => Todo(idTodo: idTodo,)));
            },
          )],
  );
}