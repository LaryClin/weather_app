import 'package:flutter/material.dart';
import 'package:weather_app/widgets/ville.dart';

import './addButton.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);
  VillesList villesList = VillesList();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            addButton(context),
            VillesList()
          ],
        )
      )
    );
  }
}
