import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget{

  late final _temperature;
  late final _description;
  late final _time;

  late final _descriptionTextSize;



  TemperatureWidget({String? temperature,String? description,String? time}){
    _temperature = temperature;
    _description = description;
    _time = time;

    _descriptionTextSize = double.parse((40 - _description.toString().length).toString());
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF468500),
        child: Stack(
          children: [
            Image.asset(
              'assets/temperature_widget.png'
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_temperature + '℃',style: TextStyle(color: Colors.white,fontSize: 70,fontWeight: FontWeight.w200),),
                      Center(child: Text(_description,style: TextStyle(color: Colors.white,fontSize:_descriptionTextSize ,fontWeight: FontWeight.w500)),),
                      Center(child: Text(_time,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w300)),),
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }

}