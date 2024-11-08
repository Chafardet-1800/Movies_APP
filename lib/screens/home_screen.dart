import 'package:flutter/material.dart';

import 'package:peliculas/provider/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';

import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        actions: [
          IconButton(
            icon: const Icon( Icons.search ), 
            onPressed: () => showSearch(
              context: context, 
            delegate: MoviesSearchDelegate(hintText: 'Buscar película')
            ), 
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            CardSwiper(
              movies: moviesProvider.onDisplayMovies
            ),
        
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
        
          ],
        ),
      ),
    );
  }
}