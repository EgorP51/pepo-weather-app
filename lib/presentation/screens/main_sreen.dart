import 'package:flutter/material.dart';
import 'package:weather_app/data/api/weather_provider.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/presentation/widgets/pepo_progress_ndicator.dart';
import 'package:weather_app/presentation/widgets/sunrise_sunset_widget.dart';
import 'package:weather_app/presentation/widgets/temperature_widget.dart';
import 'package:weather_app/utilities/TimeUtil.dart';
import '../widgets/main_widget.dart';
import '../widgets/wind_speed_widget.dart';

GlobalKey<_PlateWidgetState> globalKey = GlobalKey();

late Future<Weather> currentWeather;
late List<Widget> plateSates;
late Widget currentPlateState;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainColor = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _mainColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.refresh_rounded,
                color: Colors.black,
                size: 31,
              ),
              onPressed: () {
                globalKey.currentState!.updateScreen();
              },
            )
          ],
        ),
        body: Container(
          color: _mainColor,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: MainWidget(
                  size: 14,
                  body: PlateWidget(
                    key: globalKey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              widgetFlipper()
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetFlipper() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_sharp, size: 40),
            onPressed: () {
              globalKey.currentState!.changePlateState(-1);
            },
          ),
          const SizedBox(width: 100),
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_right, size: 40),
            onPressed: () {
              globalKey.currentState!.changePlateState(1);
            },
          )
        ],
      ),
    );
  }
}

class PlateWidget extends StatefulWidget {
  const PlateWidget({super.key});

  @override
  _PlateWidgetState createState() => _PlateWidgetState();
}

class _PlateWidgetState extends State<PlateWidget> {
  void _initializeFields(AsyncSnapshot<Weather> snapshot) {
    plateSates = [
      WindSpeedWidget(windSpeed: '${snapshot.data!.windSpeed} m/s'),
      TemperatureWidget(
        temperature: snapshot.data!.temperature ?? 404,
        description: snapshot.data!.description ?? 'no info',
        time: TimeUtil.getFormattedTime(snapshot.data!.time ?? DateTime.now()),
      ),
      SunriseSunsetWidget(
        sunrise: TimeUtil.getFormattedTime(
          snapshot.data!.sunrise ?? DateTime.now(),
        ),
        sunset: TimeUtil.getFormattedTime(
          snapshot.data!.sunset ?? DateTime.now(),
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    currentWeather = WeatherProvider.fetchCurrentWeather();
  }

  int _index = 1;

  void changePlateState(int index) {
    setState(() {
      _index += index;
      if (_index > 2) {
        _index = 0;
      } else if (_index < 0) {
        _index = 2;
      }
    });
  }

  void updateScreen() {
    setState(() {
      currentWeather = WeatherProvider.fetchCurrentWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: currentWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _initializeFields(snapshot);
          return plateSates[_index];
        } else {
          return Center(
            child: PepoProgressIndicator(
              text: 'wait',
              width: 210,
            ),
          );
        }
      },
    );
  }
}
