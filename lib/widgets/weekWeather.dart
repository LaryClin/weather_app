import 'package:flutter/material.dart';

Widget weekWeather(BuildContext context) {
  return Expanded(
    child: Container(
      width: 400,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(7),
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ListTile(
                  leading: Text("Salut ! $index"),
                  trailing: const Text("Ah"),
                  title: const Icon(Icons.list),
                ),
              ),
            );
          }),
    ),
  );
}
