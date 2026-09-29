// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserListViewModel on _UserListViewModelBase, Store {
  late final _$statusAtom =
      Atom(name: '_UserListViewModelBase.status', context: context);

  @override
  UsersStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(UsersStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$usersAtom =
      Atom(name: '_UserListViewModelBase.users', context: context);

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserListViewModelBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$loadUsersAsyncAction =
      AsyncAction('_UserListViewModelBase.loadUsers', context: context);

  @override
  Future<void> loadUsers() {
    return _$loadUsersAsyncAction.run(() => super.loadUsers());
  }

  late final _$_UserListViewModelBaseActionController =
      ActionController(name: '_UserListViewModelBase', context: context);

  @override
  void _setError(String message) {
    final _$actionInfo = _$_UserListViewModelBaseActionController.startAction(
        name: '_UserListViewModelBase._setError');
    try {
      return super._setError(message);
    } finally {
      _$_UserListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
users: ${users},
errorMessage: ${errorMessage}
    ''';
  }
}
