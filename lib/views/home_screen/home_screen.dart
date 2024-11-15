import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/views/home_screen/widget/additionalInformationbox.dart';
import 'package:weather_app/views/home_screen/widget/main_cart.dart';
import 'package:weather_app/views/home_screen/widget/weather_forcast_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("WeatherApp"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: (WeatherController.getCurrentLocation()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return const Text("Unexpected error has occcured");
          }
          var data = snapshot.data!['list'];
          var mainCardDescription = data[0]['weather'][0]['description'];
          var mainCardTemp = data[0]['main']['temp'].toString();
          var windData = data[0]['wind']['speed'].toString();
          var humidity = data[0]['main']['humidity'].toString();
          var visibility = data[0]['visibility'].toString();

          IconData weatherIcon = switch (data[0]['weather'][0]['main']) {
            "Clouds" => Icons.cloud,
            "Rain" => Icons.thunderstorm,
            _ => Icons.sunny, // default case
          };

          return Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainCart(
                  data: data,
                  temp: mainCardTemp,
                  weatherIcon: weatherIcon,
                  description: mainCardDescription,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Weather Forcast",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int i = 1; i <= data.length - 1; i++)
                        WeatherForcastCard(
                          temp: data[i]['main']['temp'].toString(),
                          icon: data[i]['weather'][0]['main'],
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Additionalinformationbox(
                      icon: Icons.water_drop,
                      title: "Humidity",
                      data: humidity,
                    ),
                    Additionalinformationbox(
                      icon: Icons.wind_power,
                      title: "Wind",
                      data: windData,
                    ),
                    Additionalinformationbox(
                      icon: Icons.umbrella_outlined,
                      title: "Visibility",
                      data: visibility,
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
