class UserName {
  const UserName({required this.first, required this.last});

  factory UserName.fromJson(Map<String, dynamic> json) {
    return UserName(
      first: json['first'] as String,
      last: json['last'] as String,
    );
  }

  final String first;
  final String last;

  Map<String, dynamic> toJson() => {'first': first, 'last': 'last'};
}
