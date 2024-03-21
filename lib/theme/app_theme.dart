import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.purple;

  static final ThemeData ligthTheme = ThemeData.light().copyWith(
       
    // Color primario
    primaryColor: primary,

    // Appbar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      foregroundColor: Colors.white,
      centerTitle: true,
    ), 

    textButtonTheme: TextButtonThemeData(
      style:  TextButton.styleFrom(
        foregroundColor: primary
      )
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      shape: CircleBorder()
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder()
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primary ),
      iconColor: primary,
      prefixIconColor: primary,
      suffixIconColor: primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),

  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
       
    // Color primario
    primaryColor: primary,

    // Appbar theme
    appBarTheme: const AppBarTheme(
      color: primary
    ),
    
    textButtonTheme: TextButtonThemeData(
      style:  TextButton.styleFrom(
        foregroundColor: primary
      )
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      shape: CircleBorder()
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder()
      )
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle( color: primary ),
      iconColor: primary,
      prefixIconColor: primary,
      suffixIconColor: primary,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),

  );
}