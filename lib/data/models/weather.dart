class Weather {
  final int? temperature;
  final String? description;
  final DateTime? time;
  final double? windSpeed;
  final DateTime? sunrise;
  final DateTime? sunset;


  Weather(
      {this.temperature,
        this.description,
        this.time,
        this.windSpeed,
        this.sunrise,
        this.sunset});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temperature: double.parse(json['main']['temp'].toString()).toInt(),
        description: json['weather'][0]['main'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
        windSpeed: json['wind']['speed'],
        sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
        sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000)
    );
  }
}
