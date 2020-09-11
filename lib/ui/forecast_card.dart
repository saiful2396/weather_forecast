import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_forecast/utility/convert_icon.dart';
import 'package:weather_forecast/utility/weather_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, index) {
  var forcastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forcastList[index].dt *1000);
  var fulDate = Util.getFormattedDate(date);
  dayOfWeek = fulDate.split(',')[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(dayOfWeek)),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forcastList[index].weather[0].main,size: 42),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('${forcastList[index].temp.min.toStringAsFixed(0)}°F'),
                  SizedBox(width: 5,),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white,)
                ],
              ),
              Row(
                children: [
                  Text('${forcastList[index].temp.max.toStringAsFixed(0)}°F'),
                  SizedBox(width: 5,),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white,)
                ],
              ),
              Text('Hum: ${forcastList[index].humidity}%'),
              Text('Win: ${forcastList[index].speed.toStringAsFixed(1)} mi/h'),
            ],
          ),
        ],
      ),
    ],
  );
}