// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentViewModel on _PaymentViewModelBase, Store {
  Computed<List<PaymentListItem>>? _$_allItemsComputed;

  @override
  List<PaymentListItem> get _allItems => (_$_allItemsComputed ??=
          Computed<List<PaymentListItem>>(() => super._allItems,
              name: '_PaymentViewModelBase._allItems'))
      .value;
  Computed<int>? _$totalCountComputed;

  @override
  int get totalCount =>
      (_$totalCountComputed ??= Computed<int>(() => super.totalCount,
              name: '_PaymentViewModelBase.totalCount'))
          .value;
  Computed<int>? _$paidCountComputed;

  @override
  int get paidCount =>
      (_$paidCountComputed ??= Computed<int>(() => super.paidCount,
              name: '_PaymentViewModelBase.paidCount'))
          .value;
  Computed<int>? _$pendingCountComputed;

  @override
  int get pendingCount =>
      (_$pendingCountComputed ??= Computed<int>(() => super.pendingCount,
              name: '_PaymentViewModelBase.pendingCount'))
          .value;
  Computed<List<PaymentListItem>>? _$visibleItemsComputed;

  @override
  List<PaymentListItem> get visibleItems => (_$visibleItemsComputed ??=
          Computed<List<PaymentListItem>>(() => super.visibleItems,
              name: '_PaymentViewModelBase.visibleItems'))
      .value;

  late final _$fetchStatusAtom =
      Atom(name: '_PaymentViewModelBase.fetchStatus', context: context);

  @override
  UsersFetchStatus get fetchStatus {
    _$fetchStatusAtom.reportRead();
    return super.fetchStatus;
  }

  @override
  set fetchStatus(UsersFetchStatus value) {
    _$fetchStatusAtom.reportWrite(value, super.fetchStatus, () {
      super.fetchStatus = value;
    });
  }

  late final _$apiUsersAtom =
      Atom(name: '_PaymentViewModelBase.apiUsers', context: context);

  @override
  ObservableList<User> get apiUsers {
    _$apiUsersAtom.reportRead();
    return super.apiUsers;
  }

  @override
  set apiUsers(ObservableList<User> value) {
    _$apiUsersAtom.reportWrite(value, super.apiUsers, () {
      super.apiUsers = value;
    });
  }

  late final _$fetchErrorMessageAtom =
      Atom(name: '_PaymentViewModelBase.fetchErrorMessage', context: context);

  @override
  String get fetchErrorMessage {
    _$fetchErrorMessageAtom.reportRead();
    return super.fetchErrorMessage;
  }

  @override
  set fetchErrorMessage(String value) {
    _$fetchErrorMessageAtom.reportWrite(value, super.fetchErrorMessage, () {
      super.fetchErrorMessage = value;
    });
  }

  late final _$visitorsAtom =
      Atom(name: '_PaymentViewModelBase.visitors', context: context);

  @override
  ObservableList<Visitor> get visitors {
    _$visitorsAtom.reportRead();
    return super.visitors;
  }

  @override
  set visitors(ObservableList<Visitor> value) {
    _$visitorsAtom.reportWrite(value, super.visitors, () {
      super.visitors = value;
    });
  }

  late final _$selectedTabAtom =
      Atom(name: '_PaymentViewModelBase.selectedTab', context: context);

  @override
  PaymentTab get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(PaymentTab value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_PaymentViewModelBase.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$loadUsersAsyncAction =
      AsyncAction('_PaymentViewModelBase.loadUsers', context: context);

  @override
  Future<void> loadUsers() {
    return _$loadUsersAsyncAction.run(() => super.loadUsers());
  }

  late final _$_PaymentViewModelBaseActionController =
      ActionController(name: '_PaymentViewModelBase', context: context);

  @override
  void _setFetchError(String message) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase._setFetchError');
    try {
      return super._setFetchError(message);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateUserPayment(String userId,
      {required double amount,
      required PaymentMethod method,
      required PaymentStatus status}) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase.updateUserPayment');
    try {
      return super.updateUserPayment(userId,
          amount: amount, method: method, status: status);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addVisitor(String name,
      {required double amount,
      required PaymentMethod method,
      String? photoPath}) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase.addVisitor');
    try {
      return super.addVisitor(name,
          amount: amount, method: method, photoPath: photoPath);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateVisitorPayment(String visitorId,
      {required double amount,
      required PaymentMethod method,
      required PaymentStatus status}) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase.updateVisitorPayment');
    try {
      return super.updateVisitorPayment(visitorId,
          amount: amount, method: method, status: status);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectTab(PaymentTab tab) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase.selectTab');
    try {
      return super.selectTab(tab);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSearchQuery(String query) {
    final _$actionInfo = _$_PaymentViewModelBaseActionController.startAction(
        name: '_PaymentViewModelBase.updateSearchQuery');
    try {
      return super.updateSearchQuery(query);
    } finally {
      _$_PaymentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchStatus: ${fetchStatus},
apiUsers: ${apiUsers},
fetchErrorMessage: ${fetchErrorMessage},
visitors: ${visitors},
selectedTab: ${selectedTab},
searchQuery: ${searchQuery},
totalCount: ${totalCount},
paidCount: ${paidCount},
pendingCount: ${pendingCount},
visibleItems: ${visibleItems}
    ''';
  }
}
