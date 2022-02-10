import 'package:flutter/material.dart';

Widget ville(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 50,
        child: const Center(child: Text('Paris')),
      ),
      IconButton(
        icon: const Icon(Icons.delete),
        tooltip: 'Supprime la ville',
        onPressed: () {
        },
      ),
    ],
  );
}