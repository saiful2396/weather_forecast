import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/utility/convert_icon.dart';
import 'package:weather_forecast/utility/weather_util.dart';


class MidView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecastModel> snapshot;
  MidView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var foreCastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var foreCast = foreCastList[0];
    var formattedDate =
    DateTime.fromMillisecondsSinceEpoch(foreCast.dt * 1000);
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$city, $country',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black87,
              ),
            ),
            Text(
              '${Util.getFormattedDate(formattedDate)}',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: foreCastList[0].weather[0].main,
                  color: Colors.blue, size: 170),
            ),
            //Icon(FontAwesomeIcons.cloud, size: 195, color: Colors.blue,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${foreCast.temp.day.toStringAsFixed(0)}°F',
                    style: TextStyle(fontSize: 34),
                  ),
                  Text('${foreCast.weather[0].description.toUpperCase()}',
                    //style: TextStyle(fontSize: 34),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('${foreCast.speed.toStringAsFixed(1)} mi/h'),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('${foreCast.humidity.toStringAsFixed(0)} %'),
                        Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('${foreCast.temp.max.toStringAsFixed(0)} °F'),
                        Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
