import 'package:flutter/material.dart';

Widget middleWeather(BuildContext context) {
  var heure = "21h";
  var image = "image";
  var temperature = "6.5";

  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      height: 100,
      width: 70,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(heure),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(image),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(temperature),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
  );
}
