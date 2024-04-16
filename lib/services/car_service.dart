import 'dart:convert';
import 'package:carwash/models/car_model.dart';
import 'package:http/http.dart' as http;


class CarService {
  final String baseUrl = "http://your-api-endpoint.com/cars";

  Future<bool> createCar(Car car, String authToken) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(car.toJson()),
    );

    if (response.statusCode == 200) {
      return true; // Carro creado exitosamente
    } else {
      print('Failed to create car: ${response.body}');
      return false; // Error al crear el carro
    }
  }
}
