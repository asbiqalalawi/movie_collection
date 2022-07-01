// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryMobx on CategoryMobxBase, Store {
  late final _$isTrueAtom =
      Atom(name: 'CategoryMobxBase.isTrue', context: context);

  @override
  bool get isTrue {
    _$isTrueAtom.reportRead();
    return super.isTrue;
  }

  @override
  set isTrue(bool value) {
    _$isTrueAtom.reportWrite(value, super.isTrue, () {
      super.isTrue = value;
    });
  }

  late final _$CategoryMobxBaseActionController =
      ActionController(name: 'CategoryMobxBase', context: context);

  @override
  dynamic setValue(bool value) {
    final _$actionInfo = _$CategoryMobxBaseActionController.startAction(
        name: 'CategoryMobxBase.setValue');
    try {
      return super.setValue(value);
    } finally {
      _$CategoryMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTrue: ${isTrue}
    ''';
  }
}
