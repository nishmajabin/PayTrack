import 'package:mobx/mobx.dart';
import 'package:pay_track/data/models/payment_method.dart';


part 'update_payment_form_view_model.g.dart';

class UpdatePaymentFormViewModel = _UpdatePaymentFormViewModelBase with _$UpdatePaymentFormViewModel;

abstract class _UpdatePaymentFormViewModelBase with Store {
  _UpdatePaymentFormViewModelBase({required PaymentMethod initialMethod, required bool initialMarkAsPaid})
      : selectedMethod = initialMethod,
        markAsPaid = initialMarkAsPaid;

  @observable
  PaymentMethod selectedMethod;

  @observable
  bool markAsPaid;

  @action
  void selectMethod(PaymentMethod method) => selectedMethod = method;

  @action
  void setMarkAsPaid(bool value) => markAsPaid = value;
}