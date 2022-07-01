// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchMobx on SearchMobxBase, Store {
  late final _$searchMoviesAtom =
      Atom(name: 'SearchMobxBase.searchMovies', context: context);

  @override
  List<Movie> get searchMovies {
    _$searchMoviesAtom.reportRead();
    return super.searchMovies;
  }

  @override
  set searchMovies(List<Movie> value) {
    _$searchMoviesAtom.reportWrite(value, super.searchMovies, () {
      super.searchMovies = value;
    });
  }

  late final _$isTrueAtom =
      Atom(name: 'SearchMobxBase.isTrue', context: context);

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

  late final _$SearchMobxBaseActionController =
      ActionController(name: 'SearchMobxBase', context: context);

  @override
  void search(String text, List<Movie> movies) {
    final _$actionInfo = _$SearchMobxBaseActionController.startAction(
        name: 'SearchMobxBase.search');
    try {
      return super.search(text, movies);
    } finally {
      _$SearchMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void change(String text, bool value) {
    final _$actionInfo = _$SearchMobxBaseActionController.startAction(
        name: 'SearchMobxBase.change');
    try {
      return super.change(text, value);
    } finally {
      _$SearchMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchMovies: ${searchMovies},
isTrue: ${isTrue}
    ''';
  }
}
