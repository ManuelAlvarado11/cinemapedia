import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.baseUrl,
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'lenguage': 'es-MX'
      },
    ),
  );

  // GET ACTORS BY MOVIE
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
