import 'package:flutter/material.dart';

import 'package:peliculas/theme/app_theme.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie,),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie,),
              _Overview(movie: movie,),
              const CastingCards()

            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only( 
            bottom: 15, 
            left: 10, 
            right: 10
          ),
          child: Text(
            movie.title,
            style: const TextStyle( fontSize: 18 ),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.backdropPathUrl),
          fit: BoxFit.cover,
        ),
      ),
    );

  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.posterUrl),
                fit: BoxFit.cover,
                height: 150,
          ),
        ),

        const SizedBox( width: 20 ),

        ConstrainedBox(
          constraints: BoxConstraints( maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title, 
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
          
              Text(
                movie.originalTitle, 
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),

              Row(
          
                children: [
                  const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                  
                  const SizedBox( width: 5 ),
          
                  Text(
                    movie.voteAverage.toString(),
                    style: textTheme.bodySmall,
                  )
                ],
              )
            ],
          ),
        )

      ]),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium,
      ),
    );
  }
}