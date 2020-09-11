import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/network/network.dart';
import 'package:weather_forecast/ui/bottom_view.dart';
import 'package:weather_forecast/ui/mid_view.dart';

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
    data = getWeather(cityName: _cityName);
    // data.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          texFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: data,
              builder: (BuildContext context , AsyncSnapshot<WeatherForecastModel> snapshot){
                if (snapshot.hasData){
                  return Column(
                    children: [
                      MidView(snapshot: snapshot),
                      BottomView(snapshot: snapshot)
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget texFieldView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter city name',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            data = getWeather(cityName: _cityName);
          });
        },
      ),
    );
  }

  Future<WeatherForecastModel> getWeather({String cityName}) => Network().getWeatherForecast(cityName: _cityName);
}
