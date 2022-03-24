import 'dart:convert';
import 'package:http/http.dart' as http;

class VilleLoc {
  // final String lat, long;
  // VilleLoc(this.lat, this.long);

  getLocalisationVille(currentVille) async {
    var response = await http.get(Uri.https('api.openweathermap.org',
        'geo/1.0/direct?q=$currentVille&limit=5&appid=c5be874f1c4057cb8e5beb187ac5f2d1'));
    var jsonData = jsonDecode(response.body);
    var coorArr = [];
    //var lat, long;

    jsonData.map((props) => {coorArr.add(props.lat), coorArr.add(props.long)});

    return coorArr;
  }

  getMeteoVille(coord) async {
    var lat = coord[0];
    var long = coord[1];
    var areaData = [];
    var response = await http.get(Uri.http('api.openweathermap.org',
        'data/2.5/weather?lat=$lat&lon=$long&appid=c5be874f1c4057cb8e5beb187ac5f2d1'));
    var jsonData = jsonDecode(response.body);

    var temp = jsonData.list.main.temp;
    var humidity = jsonData.list.wind.speed;
    var weather = jsonData.list.weather.main;

    areaData.add(temp);
    areaData.add(humidity);
    areaData.add(weather);

    return areaData;
  }
}
