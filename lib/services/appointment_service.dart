import 'dart:convert';
import 'package:carwash/models/appoinment_model.dart';
import 'package:http/http.dart' as http;
 // Asegúrate de importar el modelo de citas

class AppointmentService {
  final String baseUrl = "http://52.23.83.76/appointments";

  Future<List<Appointment>?> getUserAppointments(String authToken) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Appointment.fromJson(data)).toList();
    } else {
      print('Failed to fetch user appointments: ${response.body}');
      return null;
    }
  }
}
