import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No existe';
}
