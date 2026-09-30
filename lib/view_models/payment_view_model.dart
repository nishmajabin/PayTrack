import 'package:mobx/mobx.dart';
import 'package:pay_track/core/constants/payment_constants.dart';
import 'package:pay_track/core/errors/user_fetch_exception.dart';
import 'package:pay_track/data/models/payment_details.dart';
import 'package:pay_track/data/models/payment_list_item.dart';
import 'package:pay_track/data/models/payment_method.dart';
import 'package:pay_track/data/models/payment_status.dart';
import 'package:pay_track/data/models/user.dart';
import 'package:pay_track/data/models/visitor.dart';
import 'package:pay_track/data/repositories/user_repository.dart';

part 'payment_view_model.g.dart';

enum UsersFetchStatus { loading, success, error }

enum PaymentTab { all, users, visitors }

class PaymentViewModel = _PaymentViewModelBase with _$PaymentViewModel;

abstract class _PaymentViewModelBase with Store {
  _PaymentViewModelBase(this._userRepository);

  final UserRepository _userRepository;

  // Fetching users (Day 1 logic, reused)
  @observable
  UsersFetchStatus fetchStatus = UsersFetchStatus.loading;

  @observable
  ObservableList<User> apiUsers = ObservableList<User>();

  @observable
  String fetchErrorMessage = '';

  @action
  Future<void> loadUsers() async {
    fetchStatus = UsersFetchStatus.loading;
    fetchErrorMessage = '';

    try {
      final fetchedUsers = await _userRepository.getUsers();
      apiUsers = ObservableList.of(fetchedUsers);
      fetchStatus = UsersFetchStatus.success;
    } on UserFetchException catch (error) {
      _setFetchError(error.message);
    } catch (_) {
      _setFetchError('Something went wrong. Please try again.');
    }
  }

  @action
  void _setFetchError(String message) {
    fetchErrorMessage = message;
    fetchStatus = UsersFetchStatus.error;
  }

  // Payment info for API users — only overrides are stored, default is computed
  final ObservableMap<String, PaymentDetails> _userPayments =
      ObservableMap<String, PaymentDetails>();

  PaymentDetails paymentDetailsFor(String userId) {
    return _userPayments[userId] ??
        const PaymentDetails(amount: PaymentConstants.defaultUserAmount);
  }

  @action
  void updateUserPayment(
    String userId, {
    required double amount,
    required PaymentMethod method,
    required PaymentStatus status,
  }) {
    _userPayments[userId] = PaymentDetails(
      amount: amount,
      method: method,
      status: status,
    );
  }

  @action
  void clearAllData() {
    _userPayments.clear();
    visitors.clear();
  }

  // Visitors
  @observable
  ObservableList<Visitor> visitors = ObservableList<Visitor>();

  @action
  void addVisitor(
    String name, {
    required double amount,
    required PaymentMethod method,
    String? photoPath,
  }) {
    visitors.add(
      Visitor(
        id: 'visitor_${DateTime.now().microsecondsSinceEpoch}',
        name: name,
        amount: amount,
        method: method,
        photoPath: photoPath,
      ),
    );
  }

  @action
  void updateVisitorPayment(
    String visitorId, {
    required double amount,
    required PaymentMethod method,
    required PaymentStatus status,
  }) {
    final index = visitors.indexWhere((visitor) => visitor.id == visitorId);
    if (index == -1) return;

    visitors[index] = visitors[index].copyWith(
      amount: amount,
      method: method,
      status: status,
    );
  }

  // Tabs and search
  @observable
  PaymentTab selectedTab = PaymentTab.all;

  @action
  void selectTab(PaymentTab tab) => selectedTab = tab;

  @observable
  String searchQuery = '';

  @action
  void updateSearchQuery(String query) => searchQuery = query;

  // Combined list + summary
  @computed
  List<PaymentListItem> get _allItems => [
    for (var i = 0; i < apiUsers.length; i++) _userToItem(apiUsers[i], i),
    ...visitors.map(_visitorToItem),
  ];

  PaymentListItem _userToItem(User user, int index) {
    final details = paymentDetailsFor(user.id);
    return PaymentListItem(
      id: user.id,
      name: user.fullName,
      amount: details.amount,
      method: details.method,
      status: details.status,
      isVisitor: false,
      avatarUrl: user.picture.medium,
      displayId: 'USR-${(index + 1).toString().padLeft(4, '0')}',
    );
  }

  PaymentListItem _visitorToItem(Visitor visitor) {
    return PaymentListItem(
      id: visitor.id,
      name: visitor.name,
      amount: visitor.amount,
      method: visitor.method,
      status: visitor.status,
      isVisitor: true,
      localAvatarPath: visitor.photoPath,
    );
  }

  @computed
  int get totalCount => _allItems.length;

  @computed
  int get paidCount => _allItems.where((item) => item.isPaid).length;

  @computed
  int get pendingCount => totalCount - paidCount;

  @computed
  List<PaymentListItem> get visibleItems {
    Iterable<PaymentListItem> items = switch (selectedTab) {
      PaymentTab.all => _allItems,
      PaymentTab.users => _allItems.where((item) => !item.isVisitor),
      PaymentTab.visitors => _allItems.where((item) => item.isVisitor),
    };

    final query = searchQuery.trim().toLowerCase();
    if (query.isNotEmpty) {
      items = items.where((item) => item.name.toLowerCase().contains(query));
    }

    return items.toList();
  }
}
