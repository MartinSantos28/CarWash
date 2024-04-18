import 'dart:convert';

import 'package:carwash/models/car_model.dart';
import 'package:http/http.dart' as http;


class CarService {
  final String baseUrl = "http://52.23.83.76/cars";

  Future<bool> createCar(Car car, String authToken) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(car.toJson()),
    );

    if (response.statusCode == 201) {
      return true; // Carro creado exitosamente
    } else {
      print('Failed to create car: ${response.body}');
      return false; // Error al crear el carro
    }
  }

    Future<Map<String, dynamic>> getCars() async {
    final response = await http.get(Uri.parse('$baseUrl/2'));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body)["data"];
      print(body);
     // Map<Car> cars = body.map((dynamic item) => Car.fromJson(item)).toList();
      return body;
    } else {
      throw Exception('Failed to load cars');
    }
  }
}
