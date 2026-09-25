class UserFetchException implements Exception {
  const UserFetchException(this.message);

  final String message;

  @override
  String toString() => message;
}