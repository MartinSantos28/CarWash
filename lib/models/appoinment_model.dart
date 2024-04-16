class Appointment {
  String vehicle;
  String dateOfAppointment;
  String hour;
  String instructions;

  Appointment({
    required this.vehicle,
    required this.dateOfAppointment,
    required this.hour,
    required this.instructions,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      vehicle: json['vehicle'],
      dateOfAppointment: json['date_of_appointment'],
      hour: json['hour'],
      instructions: json['instructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicle': vehicle,
      'date_of_appointment': dateOfAppointment,
      'hour': hour,
      'instructions': instructions,
    };
  }
}
