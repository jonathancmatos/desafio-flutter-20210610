// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$productsAtom =
      Atom(name: '_HomeController.products', context: context);

  @override
  ObservableStream<List<ProductModel>>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableStream<List<ProductModel>>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  void refreshList() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.refreshList');
    try {
      return super.refreshList();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _getList() {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController._getList');
    try {
      return super._getList();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
