import 'package:flutter/material.dart';

class TemperatureWidget extends StatelessWidget {
  TemperatureWidget({
    super.key,
    required this.temperature,
    required this.description,
    required this.time,
  }) {
    descriptionTextSize =
        double.parse((40 - description.toString().length).toString());
  }

  final int temperature;
  final String description;
  final String time;

  late double descriptionTextSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF468500),
      child: Stack(
        children: [
          Image.asset('assets/temperature_widget.png'),
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$temperature ℃',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Center(
                      child: Text(
                        description,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: descriptionTextSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        time,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
