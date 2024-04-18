import 'dart:convert';

import 'package:carwash/models/User_model.dart';
import 'package:http/http.dart' as http;

class CreateUserServices {
  static const String baseUrl = 'http://52.23.83.76';

  static Future<User> createUser(String name, String last_name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      body: jsonEncode(<String, String>{
        'name': name,
        'last_name' : last_name, 
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user. Status code: ${response.statusCode}');
    }
  }

  // Función para obtener los detalles de un usuario
  static Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch user. Status code: ${response.statusCode}');
    }
  }
}
