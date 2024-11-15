import "dart:convert";
import "package:http/http.dart" as http;

class WeatherController {
  static String apiKey = "a2c78d3ed85c5de81871ebffa5c7ce03";
  static String url =
      "https://api.openweathermap.org/data/2.5/forecast?lat=10.27&lon=13.08&appid=$apiKey";
  static Future<Map<String, dynamic>> getCurrentLocation() async {
    try {
      var res = await http.get(
        Uri.parse(url),
      );
      var response = jsonDecode(res.body);
      if (response['cod'] != "200") {
        return throw "Unexpected error has occured";
      }
      // print(response['list'][0]['main']['temp']); -- FOR TEMPERATURE
      // print(response['list'][0]['weather'][0]['description']);
      //  print(response['list'][0]['weather'][0]['main']);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
