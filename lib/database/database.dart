import 'package:movies_collection/database/model/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MovieDatabase {
  static final MovieDatabase instance = MovieDatabase._init();

  static Database? _database;

  MovieDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('movie.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableMovie (
  ${MovieField.id} $idType,
  ${MovieField.title} $textType,
  ${MovieField.director} $textType,
  ${MovieField.summary} $textType,
  ${MovieField.genre} $textType
)
''');
  }

  Future<int> create(Movie movie) async {
    final db = await instance.database;

    return await db.insert(tableMovie, movie.toJson());
  }

  Future<List<Movie>> queryAll() async {
    final db = await instance.database;

    final result = await db.query(tableMovie, orderBy: MovieField.title);

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  Future<Movie> query(int id) async {
    final db = await instance.database;

    final result = await db
        .query(tableMovie, where: '${MovieField.id} = ?', whereArgs: [id]);

    return Movie.fromJson(result.first);
  }

  Future<int> update(Movie movie) async {
    final db = await instance.database;

    return db.update(tableMovie, movie.toJson(),
        where: '${MovieField.id} = ?', whereArgs: [movie.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return db
        .delete(tableMovie, where: '${MovieField.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
