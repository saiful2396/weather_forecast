import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/network/network.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<WeatherForecastModel> data;
  String _cityName = 'Dhaka';

  @override
  void initState() {
    super.initState();
    data = Network().getWeatherForecast(cityName: _cityName);
    data.then((weather) {
      print(weather.list[0].weather[0].main);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
          child: Container(
            child: Text('Hello'),
          )
      ),
    );
  }
}
