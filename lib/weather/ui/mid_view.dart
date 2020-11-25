import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/weather/model/weather_forecast_model.dart';
import 'package:weatherapp/weather/utill/convert_icon.dart';
import 'package:weatherapp/weather/utill/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data.list;
  var city = snapshot.data.city.name;
  var country = snapshot.data.city.country;
  var formattedDate = new DateTime.fromMillisecondsSinceEpoch(
      forecastList[0].dt * 1000); // muntyplying to get correct
  var forecast = forecastList[0];
  Container midView = Container(
      child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$city, $country",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87),
        ),
        Text(
          "${Util.getFormattedDate(formattedDate)}",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ), //add spacing Sized Box see later
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(
              weatherDescription: forecastList[0].weather[0].main,
              color: Colors.redAccent,
              size: 198),
        ),
        // Icon(FontAwesomeIcons.cloudSunRain, size: 198, color: Colors.redAccent),
        //Icon(
        //Icons.wb_sunny,
        //size: 195,
        //),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${forecast.temp.day.toStringAsFixed(0)} °C",
                style: TextStyle(fontSize: 34),
              ),
              Text("${forecast.weather[0].description.toUpperCase()}"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forecast.speed.toStringAsFixed(0)} mi.h"),
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 20,
                      color: Colors.red,
                    ),
                    //Icon(
                    //Icons.arrow_forward,
                    //size: 20,
                    //color: Colors.brown,
                    //)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text("${forecast.humidity.toStringAsFixed(0)} %"),
                    Icon(FontAwesomeIcons.solidGrinBeamSweat,
                        size: 20, color: Colors.red)
                    //Icon(
                    //Icons.hot_tub,
                    //size: 20,
                    //color: Colors.brown,
                    //)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${forecast.temp.max.toStringAsFixed(0)} °C"),
                    Icon(FontAwesomeIcons.temperatureHigh,
                        size: 20, color: Colors.red)
                    //Icon(
                    //Icons.wb_sunny,
                    //size: 20,
                    //color: Colors.brown,
                    //)
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  ));
  return midView;
}
