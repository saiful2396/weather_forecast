import 'package:flutter/material.dart';
import 'package:weather_forecast/model/weather_forecast_model.dart';
import 'forecast_card.dart';

class BottomView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecastModel> snapshot;
  BottomView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Container(
          height: 150,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, int index) => SizedBox(
              width: 8.0,
            ),
            itemCount: forecastList.length,
            itemBuilder: (context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF9661C3), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
