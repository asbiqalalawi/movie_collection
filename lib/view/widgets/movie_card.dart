import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_collection/database/model/movie.dart';
import 'package:movies_collection/routes/app_router.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final Movie movies;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          context.router.push(DetailMovieRoute(movieId: movies.id));
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              movies.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(movies.director),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    movies.genre,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
