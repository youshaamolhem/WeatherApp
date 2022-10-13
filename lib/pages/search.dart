import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/models.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a city'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherServices service = WeatherServices();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityname =
                  cityName;

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: 'Type a city',
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(25)),
          ),
        )));
  }
}
