import 'package:mobx/mobx.dart';

part 'category.g.dart';

class CategoryMobx = CategoryMobxBase with _$CategoryMobx;

abstract class CategoryMobxBase with Store {
  @observable
  bool isTrue = false;

  @action
  setValue(bool value) {
    if (value) {
      isTrue = false;
    } else {
      isTrue = true;
    }
  }
}
