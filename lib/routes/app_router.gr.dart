// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: HomePage(key: args.key));
    },
    DetailMovieRoute.name: (routeData) {
      final args = routeData.argsAs<DetailMovieRouteArgs>(
          orElse: () => const DetailMovieRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DetailMoviePage(key: args.key, movieId: args.movieId));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(DetailMovieRoute.name, path: '/detail-movie-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key})
      : super(HomeRoute.name, path: '/', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [DetailMoviePage]
class DetailMovieRoute extends PageRouteInfo<DetailMovieRouteArgs> {
  DetailMovieRoute({Key? key, int? movieId})
      : super(DetailMovieRoute.name,
            path: '/detail-movie-page',
            args: DetailMovieRouteArgs(key: key, movieId: movieId));

  static const String name = 'DetailMovieRoute';
}

class DetailMovieRouteArgs {
  const DetailMovieRouteArgs({this.key, this.movieId});

  final Key? key;

  final int? movieId;

  @override
  String toString() {
    return 'DetailMovieRouteArgs{key: $key, movieId: $movieId}';
  }
}
