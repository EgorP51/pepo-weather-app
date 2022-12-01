import 'package:flutter/material.dart';
import 'package:weather_app/api/WeatherService.dart';
import 'package:weather_app/utilities/TimeUtil.dart';
import 'package:weather_app/widgets/myProgressIndicator.dart';
import 'package:weather_app/widgets/sunriseSunsetWidget.dart';
import 'package:weather_app/widgets/temperatureWidget.dart';
import '../models/Weather.dart';
import '../widgets/mainWidget.dart';
import '../widgets/windSpeedWidget.dart';


GlobalKey<_PlateWidgetState> globalKey = GlobalKey();

late Future<Weather> currentWeather;
late List<Widget> plateSates;
late Widget currentPlateState;

class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{

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
                icon: Icon(Icons.refresh_rounded,color: Colors.black,size: 31,),
                onPressed: (){
                  globalKey.currentState!.updateScreen();
                },
              )
            ],
          ),
          body: Container(
            color: _mainColor,
             child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                    child: MainWidget(
                      size: 14,
                      body: PlateWidget(key: globalKey,)
                    )
                ),
                SizedBox(height: 40),
                widgetFlipper()
              ],
            ),
          )
      ),
    );
  }

  Widget widgetFlipper(){
    return Center(
       child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.keyboard_arrow_left_sharp, size: 40),
            onPressed: (){
              globalKey.currentState!.changePlateState(-1);
            },
          ),
          SizedBox(width: 100),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right, size: 40),
            onPressed: (){
              globalKey.currentState!.changePlateState(1);
            },
          )
        ],
      ),
    );
  }
}

class PlateWidget extends StatefulWidget{

  PlateWidget({Key? key}): super(key: key);

  @override
  _PlateWidgetState createState() => _PlateWidgetState();
}

class _PlateWidgetState extends State<PlateWidget>{

  void _initializeFields(AsyncSnapshot<Weather> snapshot){
    plateSates = [
      WindSpeedWidget(
          windSpeed: '${snapshot.data!.windSpeed} m/s'
      ),
      TemperatureWidget(
        temperature: snapshot.data!.temperature.toString(),
        description: snapshot.data!.description,
        time: TimeUtil.getFormattedTime(snapshot.data!.time),
      ),
      SunriseSunsetWidget(
          sunrise: TimeUtil.getFormattedTime(snapshot.data!.sunrise),
          sunset: TimeUtil.getFormattedTime(snapshot.data!.sunset)
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    currentWeather = WeatherApi.fetchCurrentWeather();
  }

  int _index = 1;
  void changePlateState(int index){
    setState(() {
      _index += index;
      if(_index > 2)
        _index = 0;
      else if(_index < 0)
        _index = 2;
    });
  }

  void updateScreen(){
     setState(() {
       currentWeather = WeatherApi.fetchCurrentWeather();
     });
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
          future: currentWeather,
          builder: (context, snapshot){
            if(snapshot.hasData) {
              _initializeFields(snapshot);
              return plateSates[_index];
            }else{
              return Center(
                  child: MyProgressIndicator(text: 'wait',width: 210,)
              );
            }
          }
    );
  }
}





