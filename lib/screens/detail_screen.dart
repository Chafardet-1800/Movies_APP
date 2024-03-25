import 'package:flutter/material.dart';

import 'package:peliculas/theme/app_theme.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
   
  const DetailScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),

          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              const CastingCards()

            ])
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return   SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title:  Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only( bottom: 15 ),
          child:  const Text(
            'Title',
            style: TextStyle( fontSize: 18 ),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/200x300'),
                fit: BoxFit.cover,
                height: 150,
          ),
        ),

        const SizedBox( width: 20 ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Movie.title', 
              style: textTheme.headlineMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'Movie.originalTitle', 
              style: textTheme.titleMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(

              children: [
                const Icon(Icons.star_border_outlined, size: 15, color: Colors.grey),
                
                const SizedBox( width: 5 ),

                Text(
                  'Movie.voteAverage',
                  style: textTheme.bodySmall,
                )
              ],
            )
          ],
        )

      ]),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        'Velit labore deserunt nulla ad. Anim dolore id ea proident sunt Lorem sint sit commodo ut. Laborum amet occaecat labore cupidatat adipisicing id enim minim elit ex labore laboris. Ut ipsum qui esse irure adipisicing deserunt nulla irure non ut do nulla ut. Ad magna laborum nisi et reprehenderit aliquip voluptate voluptate duis cupidatat in. Commodo do amet id incididunt sunt magna tempor. Duis sint ex nostrud culpa consectetur laborum et Lorem cillum. ',
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium,
      ),
    );
  }
}