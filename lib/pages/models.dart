class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;

  WeatherModel(
      {required this.weatherState,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['days'][0];
    return WeatherModel(
        weatherState: data['description'],
        date: jsonData['datetime'],
        temp: jsonData['temp'],
        maxTemp: jsonData['tempmax'],
        minTemp: jsonData['tempmin']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp, weather state = $weatherState, maxtemp= $maxTemp, mintemp= $minTemp, date =$date';
  }
}
