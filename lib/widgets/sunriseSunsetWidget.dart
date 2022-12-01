import 'package:flutter/material.dart';


class SunriseSunsetWidget extends StatelessWidget{

  late var _sunrise;
  late var _sunset;

  SunriseSunsetWidget({String? sunrise, String? sunset}){
    _sunrise = sunrise;
    _sunset = sunset;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
       child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFB63F),
                    border: Border.all(
                      width: 8,
                      color: Color(0xE4FCE163)
                    ),
                  ),
                  height: 70,
                  width: 70,
                  child: Center(child: Text(_sunrise,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xE4EF2E0C),
                    border:  Border.all(
                        width: 8,
                        color: Color(0xE4FF6864)
                    ),
                  ),
                  height: 70,
                  width: 70,
                  child: Center(child: Text(_sunset,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),
                )
              ],
            ),
          ),
          Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/sunrise_sunset_widget.png',
          ),
        ),
        ]
      ),
    );
  }
}
