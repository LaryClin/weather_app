import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/widgets/middleWeather.dart';
import 'package:weather_app/widgets/navbar.dart';
import 'package:weather_app/widgets/todayWeather.dart';
import 'package:weather_app/widgets/weekWeather.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late String villeName = "Paris";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: const NavBar(),
            appBar: AppBar(
              title: Text(
                villeName,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Center(
                child: Column(
              children: [
                todayWeather(context),
                middleWeather(context),
                weekWeather(context),
              ], //weekWeather(context)
            ))));
  }
}
