import 'package:flutter/material.dart';

Widget todayWeather(BuildContext context) {
  var jour = "Jeudi";
  var date = "03/03/2022";
  var heure = "10:34";
  var temperature = "14";
  var humidite = "14%";
  var vent = "22kmh";

  return Padding(
    padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
    child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 132, 196, 248),
                  Color.fromARGB(255, 35, 151, 197)
                ]),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        width: 400,
        height: 125,
        alignment: Alignment.center,
        child: Row(children: [
          Column(children: [
            Container(
              height: 125,
              width: 200,
              child: Column(children: [
                Container(
                  height: 62.5,
                  width: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          jour,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          date,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          heure,
                          style: const TextStyle(color: Colors.white),
                        )
                      ]),
                ),
                Container(
                  height: 62.5,
                  width: 200,
                  alignment: Alignment.center,
                  child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50))),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.access_alarm,
                            color: Colors.white,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "Clear",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ))
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      )),
                )
              ]),
            )
          ]),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 125,
                width: 200,
                child: Column(
                  children: [
                    Text(
                      temperature + "°",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      "Humidite : " + humidite,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Vent : " + vent,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )
            ],
          )
        ])),
  );
}
