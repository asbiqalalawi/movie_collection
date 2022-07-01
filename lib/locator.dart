import 'package:get_it/get_it.dart';
import 'package:movies_collection/database/database.dart';
import 'package:movies_collection/mobx/category.dart';
import 'package:movies_collection/mobx/movie_mobx.dart';
import 'package:movies_collection/mobx/search.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<MovieDatabase>(MovieDatabase.instance);
  locator.registerSingleton<CategoryMobx>(CategoryMobx());
  locator.registerSingleton<MovieMobx>(MovieMobx());
  locator.registerSingleton<SearchMobx>(SearchMobx());
}
