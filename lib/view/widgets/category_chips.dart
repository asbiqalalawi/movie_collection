import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies_collection/mobx/category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    Key? key,
    required this.categoryString,
    required this.category,
  }) : super(key: key);

  final String categoryString;
  final CategoryMobx category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => category.setValue(category.isTrue),
      child: Observer(
        builder: (context) => Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: category.isTrue ? Colors.lightBlue : null,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: category.isTrue ? Colors.white : Colors.black),
          ),
          child: Text(
            categoryString,
            style: TextStyle(color: category.isTrue ? Colors.white : null),
          ),
        ),
      ),
    );
  }
}
