import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget{

  late final _size;
  late final _body;

  MainWidget({double? size = 10,Widget body = const Center(child: Text("no value"))}){
    _size = size;
    _body = body;
  }

  late final _height = _size * 41;
  late final _width = _size * 24;
  late final _plateHeight = _size * 15.8;
  late final _plateWidth = _size * 30;
  late final _stickerWidth = _size * 25.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: _plateHeight,
              width: _plateWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                  color: Colors.black,
                  width: 5
                )
              ),
              child: _body
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
            'assets/main_widget.png',
             width: _stickerWidth,
          )
          )// STICKER HERE!
        ],
      ),
    );
  }
}//14.12