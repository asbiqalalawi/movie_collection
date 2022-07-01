// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieMobx on MovieMobxBase, Store {
  late final _$MovieMobxBaseActionController =
      ActionController(name: 'MovieMobxBase', context: context);

  @override
  void create(
      TextEditingController titleController,
      TextEditingController directorController,
      TextEditingController summaryController,
      CategoryMobx action,
      CategoryMobx animation,
      CategoryMobx drama,
      CategoryMobx scifi,
      CategoryMobx horror,
      BuildContext context) {
    final _$actionInfo = _$MovieMobxBaseActionController.startAction(
        name: 'MovieMobxBase.create');
    try {
      return super.create(titleController, directorController,
          summaryController, action, animation, drama, scifi, horror, context);
    } finally {
      _$MovieMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(
      int movieId,
      TextEditingController titleController,
      TextEditingController directorController,
      TextEditingController summaryController,
      CategoryMobx action,
      CategoryMobx animation,
      CategoryMobx drama,
      CategoryMobx scifi,
      CategoryMobx horror,
      BuildContext context) {
    final _$actionInfo = _$MovieMobxBaseActionController.startAction(
        name: 'MovieMobxBase.update');
    try {
      return super.update(movieId, titleController, directorController,
          summaryController, action, animation, drama, scifi, horror, context);
    } finally {
      _$MovieMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int id, BuildContext context) {
    final _$actionInfo = _$MovieMobxBaseActionController.startAction(
        name: 'MovieMobxBase.delete');
    try {
      return super.delete(id, context);
    } finally {
      _$MovieMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getGenre(CategoryMobx action, CategoryMobx animation,
      CategoryMobx drama, CategoryMobx scifi, CategoryMobx horror) {
    final _$actionInfo = _$MovieMobxBaseActionController.startAction(
        name: 'MovieMobxBase.getGenre');
    try {
      return super.getGenre(action, animation, drama, scifi, horror);
    } finally {
      _$MovieMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
