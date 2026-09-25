import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pay_track/core/errors/user_fetch_exception.dart';

import '../../core/constants/api_constants.dart';
import '../models/user.dart';

class UserRemoteDataSource {
  UserRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<User>> fetchUsers() async {
    try {
      final response = await _client
          .get(Uri.parse(ApiConstants.usersUrl))
          .timeout(ApiConstants.requestTimeout);

      if (response.statusCode != 200) {
        throw UserFetchException(
          'Server error (${response.statusCode}). Please try again.',
        );
      }

      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final results = body['results'] as List<dynamic>;

      return results
          .map((item) => User.fromJson(item as Map<String, dynamic>))
          .toList();
    } on TimeoutException {
      throw const UserFetchException('The request timed out. Please try again.');
    } on SocketException {
      throw const UserFetchException('No internet connection.');
    } on http.ClientException {
      throw const UserFetchException('Could not reach the server.');
    } on FormatException {
      throw const UserFetchException('Received data in an unexpected format.');
    } on TypeError {
      throw const UserFetchException('Received data in an unexpected format.');
    }
  }
}