// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String imagePath;

  User(
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.imagePath,
  );

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    String? imagePath,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      phone ?? this.phone,
      imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'imagePath': imagePath,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['id'] as int,
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['phone'] as String,
      map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, phone: $phone, imagePath: $imagePath)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        imagePath.hashCode;
  }
}
