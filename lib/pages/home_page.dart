
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/models.dart';
import 'package:weather_app/pages/search.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(
                  flex: 3,
                ),
                Text('${Provider.of<WeatherProvider>(context).cityname}'),
                Text('12/12/2022'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.sunny,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Text(
                      '${weatherData.temp.toInt()}',
                      style: TextStyle(fontSize: 55.0),
                    ),
                    Column(
                      children: [
                        Text('mintemp: ${weatherData.minTemp.toInt()}'),
                        Text('maxtemp: ${weatherData.maxTemp.toInt()}')
                      ],
                    )
                  ],
                ),
                Text('${weatherData.weatherState}'),
                Spacer(
                  flex: 3,
                ),
                Text(weatherData.weatherState)
              ],
            ),
    );
  }
}
