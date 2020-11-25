import 'package:flutter/material.dart';
import 'package:weatherapp/weather/model/weather_forecast_model.dart';

import 'forecast_card.dart';

Widget bottomView(
    AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Text(
        "7-Day WEATHER FORECAST".toUpperCase(),
        style: TextStyle(fontSize: 14, color: Colors.black87),
      ),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal, //scrolling view
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: forecastList.length,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width / 2.4, //size of box
                    height: 160,
                    child: forecastCard(snapshot, index),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff9661c3), Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                )),
      )
    ],
  );
}
