import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottonNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);


    if(slideShowMovies.isEmpty) return const CircularProgressIndicator();

    return Column(
      children: [

        const CustomAppbar(),

        MoviesSlideShow(movies: slideShowMovies),

        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'En Cines',
          subTitle: 'Lunes 20',
        ),
      ],
    );
  }
}