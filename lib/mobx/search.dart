import 'package:mobx/mobx.dart';
import 'package:movies_collection/database/model/movie.dart';

part 'search.g.dart';

class SearchMobx = SearchMobxBase with _$SearchMobx;

abstract class SearchMobxBase with Store {
  @observable
  List<Movie> searchMovies = [];

  @observable
  bool isTrue = false;

  @action
  void search(String text, List<Movie> movies) {
    searchMovies.clear();
    for (Movie element in movies) {
      if (element.title.toLowerCase().contains(text)) searchMovies.add(element);
    }
  }

  @action
  void change(String text, bool value) {
    if (text.isEmpty) {
      isTrue = false;
    } else {
      isTrue = true;
    }
  }
}
