import 'package:flutter/material.dart';

class PepoProgressIndicator extends StatelessWidget {
  late final String? _text;
  late final double? _width;

  PepoProgressIndicator({
    super.key,
    String? text = 'wait',
    double? width = 50,
  }) {
    _width = width;
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/progressIndicator.gif',
          width: _width,
        ),
        Text(
          _text!,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
