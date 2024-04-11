import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/provider/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({
    super.key, 
    required this.movieId
  });

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return FutureBuilder(
      future: moviesProvider.getMoviesCast(movieId), 
      builder: (_, AsyncSnapshot<List<Cast>> snapshot){

        if( !snapshot.hasData ) {
          return const SizedBox(
            width: double.infinity,
            height: 180,
            child: Center( child: CircularProgressIndicator(),),
          );
        }

        final List<Cast> cast = snapshot.data!;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 30 ),
          width: double.infinity,
          height: 200,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _, int index) => _CastCard( profile: cast[index] ),
          ),
        );
      }
    );

  }
}

class _CastCard extends StatelessWidget {

  final Cast profile;

  const _CastCard({
    required this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(profile.profilePathUrl),
                fit: BoxFit.cover,
                height: 140,
                width: 100,
            )
          ),

          const SizedBox( height: 5 ),

          Text(
            profile.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ]
      ),
    );
  }
}