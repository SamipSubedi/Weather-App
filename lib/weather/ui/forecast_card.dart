import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/weather/model/weather_forecast_model.dart';
import 'package:weatherapp/weather/utill/convert_icon.dart';
import 'package:weatherapp/weather/utill/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = "";
  DateTime date =
      new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0]; //[split = Saturday, Dec14, 2019] example
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )), // wrapped with center to bring day at center and padding for space
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //<Widget> no need to write ??? research
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
                weatherDescription: forecastList[index].weather[0].main,
                //color: Colors.pinkAccent,
                size: 45),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        "${forecastList[index].temp.min.toStringAsFixed(0)} °C"),
                  ),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.red,
                    size: 17,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                        "${forecastList[index].temp.max.toStringAsFixed(0)} °C"),
                    Icon(
                      FontAwesomeIcons.solidArrowAltCircleUp,
                      color: Colors.deepPurpleAccent,
                      size: 17,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                        "Hum: ${forecastList[index].humidity.toStringAsFixed(0)} %"),
                    // Icon(
                    // FontAwesomeIcons.solidGrinBeamSweat,
                    // color: Colors.pink,
                    // size: 17,
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                        "wind:${forecastList[index].speed.toStringAsFixed(0)} mi/h"),
                    //Icon(
                    //FontAwesomeIcons.wind,
                    //color: Colors.lightBlue,
                    //size: 17,
                    //)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
