import 'package:flutter/material.dart';

class SunriseSunsetWidget extends StatelessWidget {
  const SunriseSunsetWidget({
    required this.sunrise,
    required this.sunset,
    super.key,
  });

  final String sunrise;
  final String sunset;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFB63F),
                    border:
                        Border.all(width: 8, color: const Color(0xE4FCE163)),
                  ),
                  height: 70,
                  width: 70,
                  child: Center(
                      child: Text(
                    sunrise,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xE4EF2E0C),
                    border: Border.all(
                      width: 8,
                      color: const Color(0xE4FF6864),
                    ),
                  ),
                  height: 70,
                  width: 70,
                  child: Center(
                    child: Text(
                      sunset,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
        ],
      ),
    );
  }
}
