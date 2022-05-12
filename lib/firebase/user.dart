import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  final String name;
  final String age;

  User({
    this.id = '',
    required this.name,
    required this.age
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'age': age
  };

  static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    age: json['age']
  );
}