class Car {
  String brand;
  String model;
  String yearOfModel;
  String color;

  Car({
    required this.brand,
    required this.model,
    required this.yearOfModel,
    required this.color,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      brand: json['brand'],
      model: json['model'],
      yearOfModel: json['year_of_model'],
      color: json['color'],
    );
  }

  String get imageUrl => "" ;

  get id => null;

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'year_of_model': yearOfModel,
      'color': color,
    };
  }
}
