
import 'package:http/http.dart' as http;

class CarService {
  final String baseUrl = "http://52.23.83.76/cars";

  Future<bool> deleteCar(int carId, String authToken) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$carId"), 
      headers: <String, String>{
        'Authorization': 'Bearer $authToken',
        
      },
    );

    if (response.statusCode == 200) {
      return true; 
    } else {
      print('Failed to delete car: ${response.body}');
      return false; 
    }
  }
}
