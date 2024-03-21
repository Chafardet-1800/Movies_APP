import 'package:flutter/material.dart';

import 'package:peliculas/models/models.dart';
import 'package:peliculas/screens/screens.dart';

class AppRoutes {

  static const initialRoutes = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'detail', name: 'Detalle', screen: const DetailScreen(), icon: Icons.list),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({ 'home' : (BuildContext context) => const HomeScreen() });
    
    for (final option in menuOptions) {
      
      appRoutes.addAll({ option.route : (BuildContext context) => option.screen });

    }

    return appRoutes;

  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //       '/home'    : (BuildContext context)=> const HomeScreen(),
  //       '/listView': (BuildContext context)=> const ListviewScreen(),
  //       '/alert'   : (BuildContext context)=> const AlertScreen(),
  //       '/cards'   : (BuildContext context)=> const CardScreen(),
  //     };

  static Route<dynamic> onGeneralRoute (RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }

}