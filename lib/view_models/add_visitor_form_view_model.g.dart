// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_visitor_form_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddVisitorFormViewModel on _AddVisitorFormViewModelBase, Store {
  late final _$selectedMethodAtom = Atom(
      name: '_AddVisitorFormViewModelBase.selectedMethod', context: context);

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

  late final _$photoPathAtom =
      Atom(name: '_AddVisitorFormViewModelBase.photoPath', context: context);

  @override
  String? get photoPath {
    _$photoPathAtom.reportRead();
    return super.photoPath;
  }

  @override
  set photoPath(String? value) {
    _$photoPathAtom.reportWrite(value, super.photoPath, () {
      super.photoPath = value;
    });
  }

  late final _$_AddVisitorFormViewModelBaseActionController =
      ActionController(name: '_AddVisitorFormViewModelBase', context: context);

  @override
  void selectMethod(PaymentMethod method) {
    final _$actionInfo = _$_AddVisitorFormViewModelBaseActionController
        .startAction(name: '_AddVisitorFormViewModelBase.selectMethod');
    try {
      return super.selectMethod(method);
    } finally {
      _$_AddVisitorFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoto(String? path) {
    final _$actionInfo = _$_AddVisitorFormViewModelBaseActionController
        .startAction(name: '_AddVisitorFormViewModelBase.setPhoto');
    try {
      return super.setPhoto(path);
    } finally {
      _$_AddVisitorFormViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMethod: ${selectedMethod},
photoPath: ${photoPath}
    ''';
  }
}
