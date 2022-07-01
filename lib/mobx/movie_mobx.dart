import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies_collection/database/database.dart';
import 'package:movies_collection/database/model/movie.dart';
import 'package:movies_collection/mobx/category.dart';

part 'movie_mobx.g.dart';

final getIt = GetIt.instance;

class MovieMobx = MovieMobxBase with _$MovieMobx;

abstract class MovieMobxBase with Store {
  @action
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
    getIt<MovieDatabase>()
        .create(
          Movie(
            title: titleController.text,
            director: directorController.text,
            summary: summaryController.text,
            genre: getGenre(action, animation, drama, scifi, horror),
          ),
        )
        .then((value) => context.router.navigateBack());
  }

  @action
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
    getIt<MovieDatabase>()
        .update(
          Movie(
            id: movieId,
            title: titleController.text,
            director: directorController.text,
            summary: summaryController.text,
            genre: getGenre(action, animation, drama, scifi, horror),
          ),
        )
        .then((value) => context.router.navigateBack());
  }

  @action
  void delete(int id, BuildContext context) {
    getIt<MovieDatabase>()
        .delete(id)
        .then((value) => context.router.navigateBack());
  }

  @action
  String getGenre(CategoryMobx action, CategoryMobx animation,
      CategoryMobx drama, CategoryMobx scifi, CategoryMobx horror) {
    List<String> genre = [];

    if (action.isTrue) {
      genre.add('Action');
    }
    if (animation.isTrue) {
      genre.add('Animation');
    }
    if (drama.isTrue) {
      genre.add('Drama');
    }
    if (scifi.isTrue) {
      genre.add('Sci-Fi');
    }
    if (horror.isTrue) {
      genre.add('Horror');
    }

    return genre
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(', ', ' / ');
  }
}
