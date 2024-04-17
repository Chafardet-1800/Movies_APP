import 'package:flutter/material.dart';

class MoviesSearchDelegate extends SearchDelegate<String> {

  MoviesSearchDelegate({
    required String hintText,
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );

  @override
  Widget buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, ''), 
    icon: const Icon(Icons.arrow_back)
  );

  @override
  List<Widget> buildActions(BuildContext context) => <Widget>[
    IconButton(
      onPressed: () => query = '', 
      icon: const Icon(Icons.close)
    )
  ];

  @override
  PreferredSizeWidget buildBottom(BuildContext context) {
    return const PreferredSize(
       preferredSize: Size.fromHeight(0),
       child: Text(''));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty) {
      return const SizedBox(
        child: Center(
          child: Icon(
            Icons.movie_creation_outlined, 
            color: Colors.black38,
            size: 145,
          ),
        )
      );
    }

    return Container();
    
  }

  @override
  Widget buildResults(BuildContext context) => const Text('results');

}