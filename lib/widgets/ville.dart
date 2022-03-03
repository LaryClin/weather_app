import 'package:flutter/material.dart';

Widget ville(BuildContext context) {
  var villes = ["Paris", "Lyon", "Marseille"];

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

  return Expanded(
    child: ListView.builder(
        itemCount: villes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: 50,
              child: ListTile(
                leading:
                    TextButton(onPressed: () {}, child: Text(villes[index])),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _showMyDeleteDialog();
                  },
                ),
              ));
        }),
  );
}
