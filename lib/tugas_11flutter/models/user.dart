import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String email;
  final String password;
  final String name;
  final String school;
  final String city;
  User({
    required this.email,
    required this.password,
    required this.name,
    required this.school,
    required this.city,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name ': name,
      "school": school,
      "city": city,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      school: map["school"] as String,
      city: map["city"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
