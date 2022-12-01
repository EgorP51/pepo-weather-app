import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget{

  late final String? _text;
  late final double? _width;

  MyProgressIndicator({String? text = 'wait',double? width = 50}) {
    _width = width;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/progressIndicator.gif',
            width: _width,
          ),
          Text(_text!,style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }

}