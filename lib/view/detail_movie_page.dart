import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_collection/database/database.dart';
import 'package:movies_collection/database/model/movie.dart';
import 'package:movies_collection/mobx/category.dart';
import 'package:movies_collection/mobx/movie_mobx.dart';
import 'package:movies_collection/view/widgets/category_chips.dart';

class DetailMoviePage extends StatelessWidget {
  DetailMoviePage({Key? key, this.movieId}) : super(key: key);
  final int? movieId;

  final getIt = GetIt.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  final action = CategoryMobx();
  final animation = CategoryMobx();
  final drama = CategoryMobx();
  final scifi = CategoryMobx();
  final horror = CategoryMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(movieId != null ? 'Update Movie' : 'Add Movie'),
          actions: [
            movieId != null
                ? IconButton(
                    onPressed: () {
                      getIt<MovieMobx>().delete(movieId!, context);
                    },
                    icon: const Icon(Icons.delete))
                : const SizedBox(),
            IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      (action.isTrue ||
                          animation.isTrue ||
                          drama.isTrue ||
                          scifi.isTrue ||
                          horror.isTrue)) {
                    if (movieId == null) {
                      getIt<MovieMobx>().create(
                          titleController,
                          directorController,
                          summaryController,
                          action,
                          animation,
                          drama,
                          scifi,
                          horror,
                          context);
                    } else {
                      getIt<MovieMobx>().update(
                          movieId!,
                          titleController,
                          directorController,
                          summaryController,
                          action,
                          animation,
                          drama,
                          scifi,
                          horror,
                          context);
                    }
                  } else if (!action.isTrue &&
                      !animation.isTrue &&
                      !drama.isTrue &&
                      !scifi.isTrue &&
                      !horror.isTrue) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Movie Genre Not Filled Yet'),
                        content: const Text(
                            'Select at least one genre to save the movie.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check)),
          ]),
      body: Form(
        key: _formKey,
        child: movieId == null
            ?
            // New Movie
            ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Title",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter movie title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: directorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Director",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the film director';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: summaryController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Summary",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter movie summary';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      CategoryChips(category: action, categoryString: 'Action'),
                      CategoryChips(
                          category: animation, categoryString: 'Animation'),
                      CategoryChips(category: drama, categoryString: 'Drama'),
                      CategoryChips(category: scifi, categoryString: 'Sci-Fi'),
                      CategoryChips(category: horror, categoryString: 'Horror'),
                    ],
                  )
                ],
              )
            :
            // Update Moviee
            FutureBuilder<Movie>(
                future: getIt<MovieDatabase>().query(movieId!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Movie movie = snapshot.data!;
                    titleController.text = movie.title;
                    directorController.text = movie.director;
                    summaryController.text = movie.summary;
                    titleController.text = movie.title;

                    if (movie.genre.contains('Action')) {
                      action.setValue(action.isTrue);
                    }
                    if (movie.genre.contains('Animation')) {
                      animation.setValue(animation.isTrue);
                    }
                    if (movie.genre.contains('Drama')) {
                      drama.setValue(drama.isTrue);
                    }
                    if (movie.genre.contains('Sci-Fi')) {
                      scifi.setValue(scifi.isTrue);
                    }
                    if (movie.genre.contains('Horror')) {
                      horror.setValue(horror.isTrue);
                    }

                    return ListView(
                      padding: const EdgeInsets.all(20),
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Title",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter movie title';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: directorController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Director",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter the film director';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: summaryController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Summary",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter movie summary';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            CategoryChips(
                                category: action, categoryString: 'Action'),
                            CategoryChips(
                                category: animation,
                                categoryString: 'Animation'),
                            CategoryChips(
                                category: drama, categoryString: 'Drama'),
                            CategoryChips(
                                category: scifi, categoryString: 'Sci-Fi'),
                            CategoryChips(
                                category: horror, categoryString: 'Horror'),
                          ],
                        )
                      ],
                    );
                  }
                },
              ),
      ),
    );
  }
}
