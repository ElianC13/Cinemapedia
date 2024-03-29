import 'package:cinemapedia/domain/entities/entities.dart';
import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

class SimilarMovies extends ConsumerWidget {

  final int movieId;

  const SimilarMovies({super.key, required this.movieId,});
 
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: (movies) => _Recomendation(movies: movies), 
      error: (_, __) => const Center(child: Text('No se pudo cargar peliculas similares')), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2,),)
    );
  }

}

class _Recomendation extends StatelessWidget {
  final List<Movie> movies;

  const _Recomendation({ required this.movies});

  @override
  Widget build(BuildContext context) {
    if(movies.isEmpty) return const SizedBox();

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50),
      child: MovieHorizontalListview(
        title: 'Recomendaciones',
        movies: movies
      ),
    );
  }
}