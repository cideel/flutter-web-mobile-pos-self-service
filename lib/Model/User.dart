class User {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone_number': phoneNumber,
    'email': email,
    'token': token,
  };
}
