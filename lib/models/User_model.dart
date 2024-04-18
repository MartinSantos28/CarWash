class User {
  
  final String name;
  final String last_name;
  final String email;
  final String password;

  User({
    required this.name,
    required this.last_name,
    required this.email,
    required this.password
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      last_name: json['last_name'],
      email: json['email'],
      password: json['password']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'last_name': last_name,
      'email': email,
      'password' : password
    };
  }
}
