import 'package:flutter/material.dart';

class WeatherForcastCard extends StatelessWidget {
  final String temp;
  final dynamic icon;
  const WeatherForcastCard({super.key, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    String temperature = (double.parse(temp) - 273.15).toStringAsFixed(1);
    IconData weatherIcon = switch (icon) {
      "Clouds" => Icons.cloud,
      "Rain" => Icons.thunderstorm,
      "Snow" => Icons.snowboarding,
      _ => Icons.sunny, // default case
    };
    return Card(
      child: SizedBox(
        width: 80,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Sun"),
            Icon(weatherIcon),
            Text("$temperature C"),
          ],
        ),
      ),
    );
  }
}
