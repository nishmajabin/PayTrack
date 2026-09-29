import 'package:flutter/material.dart';
import 'package:pay_track/data/remote/user_remote_datasource.dart';
import 'app.dart';
import 'data/repositories/user_repository.dart';
import 'view_models/user_list_view_model.dart';

void main() {
  final userRepository = UserRepository(UserRemoteDataSource());
  final userListViewModel = UserListViewModel(userRepository);
  userListViewModel.loadUsers();

  runApp(PayTrackApp(userListViewModel: userListViewModel));
}