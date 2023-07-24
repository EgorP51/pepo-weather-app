import 'package:flutter/material.dart';

class WindSpeedWidget extends StatelessWidget {
  const WindSpeedWidget({super.key, required this.windSpeed});

  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2D3F51),
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
            child: Text(
              windSpeed,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 27,
              ),
            ),
          )
        ],
      ),
    );
  }
}
