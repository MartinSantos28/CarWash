import 'dart:convert';
import 'package:carwash/models/car_model.dart';
import 'package:http/http.dart' as http;


class CarService {
  final String baseUrl = "http://52.23.83.76/cars";

  Future<bool> updateCar(Car car, String authToken) async {
    final response = await http.put(
      Uri.parse("$baseUrl/${car.id}"), // Reemplaza 'id' con el campo adecuado para identificar el carro que quieres actualizar
      headers: <String, String>{
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(car.toJson()), // Aquí debes enviar los datos actualizados del carro
    );

    if (response.statusCode == 200) {
      return true; // Actualización exitosa
    } else {
      print('Failed to update car: ${response.body}');
      return false; // Error en la actualización del carro
    }
  }
}
