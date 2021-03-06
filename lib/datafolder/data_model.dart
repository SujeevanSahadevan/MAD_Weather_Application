/*
{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }                         
*/

//////////////////////////////

class WeatherInformation {
  final String description;
  final String icon;

  WeatherInformation({required this.description, required this.icon});

  factory WeatherInformation.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInformation(description: description, icon: icon);
  }
}

/////////////////////////////////////////

class TemperatureInformation {
  final double temp;
  TemperatureInformation({required this.temp});

  factory TemperatureInformation.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return TemperatureInformation(temp: temp);
  }
}

///////////////////////////////////////
class WeatherResponse {
  final String cityName;
  final TemperatureInformation tempInformation;
  final WeatherInformation weatherInformation;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInformation.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInformation,
      required this.weatherInformation});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInformationJson = json['main'];
    final tempInformation =
        TemperatureInformation.fromJson(tempInformationJson);

    final weatherInformationJson = json['weather'][0];
    final weatherInformation =
        WeatherInformation.fromJson(weatherInformationJson);

    return WeatherResponse(
        cityName: cityName,
        tempInformation: tempInformation,
        weatherInformation: weatherInformation);
  }
}

/////////////////////////////////////////////
