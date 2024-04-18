import 'dart:convert';

import 'package:carwash/models/appoinment_model.dart';
import 'package:http/http.dart' as http;
 

class AppointmentService {
  final String baseUrl = "http://52.23.83.76/appointments";

  Future<Map<String, dynamic>> getUserAppointments() async {
    final response = await http.get(Uri.parse('$baseUrl/1'));

    if (response.statusCode == 200 ){
      Map<String, dynamic> body = jsonDecode(response.body)["data"];
      print(body);
      return body;
    } else {
      throw Exception('failed to load Appoinments');
    }
  }
    Future<bool> createAppointment(Appointment appointment, String authToken) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      },
      body: json.encode(appointment.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to create appointment: ${response.body}');
      return false;
    }
  }

    Future<bool> updateAppointment(String id, Appointment appointment, String authToken) async {
    final response = await http.put(
      Uri.parse('$baseUrl/1'), // Asume que la URL del endpoint para actualizar necesita el ID del appointment
      headers: <String, String>{
        'Authorization': 'Bearer $authToken', // Autenticación, si es necesaria
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(appointment.toJson()),
    );

    if (response.statusCode == 200) {
      return true; // La cita fue actualizada exitosamente
    } else {
      print('Failed to update appointment: ${response.body}');
      return false; // Hubo un error al actualizar la cita
    }
  }

Future<bool> deleteAppointment(String appointmentId, String authToken) async {
  final response = await http.delete(
    Uri.parse('$baseUrl/$appointmentId'), // Incluye el ID de la cita en la URL
    headers: <String, String>{
      'Authorization': 'Bearer $authToken', // La autenticación es requerida y el token debe ser correcto
    },
  );

  if (response.statusCode == 200) {
    // La eliminación fue exitosa
    return true;
  } else {
    // Hubo un error al eliminar la cita
    return false;
  }
}
}




