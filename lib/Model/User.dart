class User {
  final String name;
  final String phoneNumber;
  final String email;
  final String token;
  final int points;

  User({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.token,
    this.points = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      token: json['token'],
      points: json['points'] ?? 0, // Default nilai 0 jika tidak ada
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone_number': phoneNumber,
    'email': email,
    'token': token,
    'points': points,
  };
}
