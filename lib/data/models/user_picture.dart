class UserPicture {
  const UserPicture({required this.large, required this.medium});

  factory UserPicture.fromJson(Map<String, dynamic> json) {
    return UserPicture(
      large: json['large'] as String,
      medium: json['medium'] as String,
    );
  }

  final String large;
  final String medium;

  Map<String, dynamic> toJson() => {'large': large, 'medium': medium};
}
