import 'package:mobx/mobx.dart';
import 'package:pay_track/data/repositories/user_repository.dart';


import '../core/errors/user_fetch_exception.dart';
import '../data/models/user.dart';
part 'user_list_view_model.g.dart';

enum UsersStatus { loading, success, error }

class UserListViewModel = _UserListViewModelBase with _$UserListViewModel;

abstract class _UserListViewModelBase with Store {
  _UserListViewModelBase(this._userRepository);

  final UserRepository _userRepository;

  @observable
  UsersStatus status = UsersStatus.loading;

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  String errorMessage = '';

  @action
  Future<void> loadUsers() async {
    status = UsersStatus.loading;
    errorMessage = '';

    try {
      final fetchedUsers = await _userRepository.getUsers();
      users = ObservableList.of(fetchedUsers);
      status = UsersStatus.success;
    } on UserFetchException catch (error) {
      _setError(error.message);
    } catch (_) {
      _setError('Something went wrong. Please try again.');
    }
  }

  @action
  void _setError(String message) {
    errorMessage = message;
    status = UsersStatus.error;
  }
}