import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_collection/database/database.dart';
import 'package:movies_collection/database/model/movie.dart';
import 'package:movies_collection/mobx/search.dart';
import 'package:movies_collection/routes/app_router.dart';
import 'package:movies_collection/view/widgets/movie_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final getIt = GetIt.instance;
  final search = SearchMobx();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Collection'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: FutureBuilder<List<Movie>>(
            future: getIt<MovieDatabase>().queryAll(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                List<Movie> movies = snapshot.data!;

                return Column(
                  children: [
                    TextField(
                      onChanged: (String text) {
                        search.search(text, movies);
                        search.change(text, search.isTrue);
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Search by title...'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Observer(builder: (context) {
                        if (!search.isTrue) {
                          // Not Search
                          return ListView.separated(
                            padding: const EdgeInsets.only(bottom: 10),
                            itemCount: movies.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 10,
                            ),
                            itemBuilder: (context, index) =>
                                MovieCard(movies: movies[index]),
                          );
                        } else {
                          // Search
                          return ListView.separated(
                              padding: const EdgeInsets.only(bottom: 10),
                              itemCount: search.searchMovies.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(
                                        height: 10,
                                      ),
                              itemBuilder: (context, index) => MovieCard(
                                  movies: search.searchMovies[index]));
                        }
                      }),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('There is an error'),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(DetailMovieRoute()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
