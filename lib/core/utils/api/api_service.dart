import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/api/api_keys.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://api.weatherapi.com/v1/",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<dynamic> fetchWeather({required String location}) async {
    try {
      Response response = await dio.get(
        "forecast.json",
        queryParameters: {
          "key": apiKey,
          "q": location, // City name or coordinates
          "days": 7, // Forecast for 7 days
          "aqi": "no", // Air Quality Index
          "alerts": "no" // Weather alerts
        },
      );

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch weather: $e');
    }
  }
}
