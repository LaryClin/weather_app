import 'package:flutter/material.dart';
import 'package:weather_app/widgets/ville.dart';

import './addButton.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            addButton(context),
            ville(context)
          ],
        )
      )
    );
  }
}
