import 'package:pay_track/data/models/user.dart';
import 'package:pay_track/data/remote/user_remote_datasource.dart';

class UserRepository {
  const UserRepository(this._remoteDataSource);

  final UserRemoteDataSource _remoteDataSource;

  Future<List<User>> getUsers() => _remoteDataSource.fetchUsers();
}