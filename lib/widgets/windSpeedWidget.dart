import 'package:flutter/material.dart';

class WindSpeedWidget extends StatelessWidget{

  late final _windSpeed;

  WindSpeedWidget({String? windSpeed}){
    _windSpeed = windSpeed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2D3F51),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/wind_speed_widget.gif',
            ),
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Text(_windSpeed, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 27))
          )
        ],
      ),
    );
  }
}