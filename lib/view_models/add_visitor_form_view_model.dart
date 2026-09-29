import 'package:mobx/mobx.dart';
import 'package:pay_track/data/models/payment_method.dart';


part 'add_visitor_form_view_model.g.dart';

class AddVisitorFormViewModel = _AddVisitorFormViewModelBase with _$AddVisitorFormViewModel;

abstract class _AddVisitorFormViewModelBase with Store {
  @observable
  PaymentMethod selectedMethod = PaymentMethod.cash;

  @observable
  String? photoPath;

  @action
  void selectMethod(PaymentMethod method) => selectedMethod = method;

  @action
  void setPhoto(String? path) => photoPath = path;
}