import 'location.dart';
import 'networking.dart';

const apiKey = "f232c67b3e897650da7dd9fb961fce78";
const openWeatherAPIURL = 'https://api.openweathermap.org/data/2.5/weather';

class LocationModel {
  Future<dynamic> getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();
    
    NetworkHelper helper = NetworkHelper(
        '$openWeatherAPIURL?lat=${location.lat}&lon=${location.long}&appid=$apiKey&units=metric');

    
    var weatherData = await helper.getWeatherData();
    return weatherData;
  }
}
