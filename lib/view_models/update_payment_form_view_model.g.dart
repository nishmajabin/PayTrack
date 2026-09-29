// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_payment_form_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdatePaymentFormViewModel on _UpdatePaymentFormViewModelBase, Store {
  late final _$selectedMethodAtom = Atom(
      name: '_UpdatePaymentFormViewModelBase.selectedMethod', context: context);

  @override
  PaymentMethod get selectedMethod {
    _$selectedMethodAtom.reportRead();
    return super.selectedMethod;
  }

  @override
  set selectedMethod(PaymentMethod value) {
    _$selectedMethodAtom.reportWrite(value, super.selectedMethod, () {
      super.selectedMethod = value;
    });
  }

  late final _$markAsPaidAtom = Atom(
      name: '_UpdatePaymentFormViewModelBase.markAsPaid', context: context);

  @override
  bool get markAsPaid {
    _$markAsPaidAtom.reportRead();
    return super.markAsPaid;
  }

  @override
  set markAsPaid(bool value) {
    _$markAsPaidAtom.reportWrite(value, super.markAsPaid, () {
      super.markAsPaid = value;
    });
  }

  late final _$_UpdatePaymentFormViewModelBaseActionController =
      ActionController(
          name: '_UpdatePaymentFormViewModelBase', context: context);

  @override
  void selectMethod(PaymentMethod method) {
    final _$actionInfo = _$_UpdatePaymentFormViewModelBaseActionController
        .startAction(name: '_UpdatePaymentFormViewModelBase.selectMethod');
    try {
      return super.selectMethod(method);
    } finally {
      _$_UpdatePaymentFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMarkAsPaid(bool value) {
    final _$actionInfo = _$_UpdatePaymentFormViewModelBaseActionController
        .startAction(name: '_UpdatePaymentFormViewModelBase.setMarkAsPaid');
    try {
      return super.setMarkAsPaid(value);
    } finally {
      _$_UpdatePaymentFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMethod: ${selectedMethod},
markAsPaid: ${markAsPaid}
    ''';
  }
}
