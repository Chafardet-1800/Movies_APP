import 'package:flutter/material.dart';

import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        actions: [
          IconButton(
            icon: const Icon( Icons.search ), 
            onPressed: () {}, 
          )
        ],
      ),
      body: const Column(
         children: [

            CardSwiper()

         ],
      ),
    );
  }
}