import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';

class MainCart extends StatelessWidget {
  final dynamic data;
  final String temp;
  final IconData weatherIcon;
  final String description;
  const MainCart(
      {super.key,
      required this.data,
      required this.temp,
      required this.weatherIcon,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: WeatherController.getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return SizedBox(
            width: double.infinity,
            height: 200,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "$temp K",
                    style: const TextStyle(fontSize: 28),
                  ),
                  Icon(
                    weatherIcon,
                    size: 70,
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          );
        });
  }
}
