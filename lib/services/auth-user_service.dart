import 'dart:convert';
import 'package:carwash/models/Auth_user_model.dart';
import 'package:http/http.dart' as http;


class AuthService {
  final String baseUrl = "http://52.23.83.76/users";

  Future<bool> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true; // Inicio de sesión exitoso
    } else {
      print('Failed to login: ${response.body}');
      return false; // Error en el inicio de sesión
    }
  }

  Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return true; // Usuario registrado exitosamente
    } else {
      print('Failed to register user: ${response.body}');
      return false; // Error al registrar al usuario
    }
  }
}
