import 'package:pay_track/data/models/user_name.dart';
import 'package:pay_track/data/models/user_picture.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
  });

  final String id;
  final UserName name;
  final String email;
  final UserPicture picture;

  factory User.fromJson(Map<String, dynamic> json) {
    final login = json['login'] as Map<String, dynamic>;
    return User(
      id: login['uuid'] as String,
      name: UserName.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String,
      picture: UserPicture.fromJson(json['picture'] as Map<String, dynamic>),
    );
  }

  String get fullName => '${name.first} ${name.last}';

  Map<String, dynamic> toJson() {
    return {
      'login': {'uuid': id},
      'name': name.toJson(),
      'email': email,
      'picture': picture.toJson(),
    };
  }
}
