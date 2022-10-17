import 'package:flutter/material.dart';

import 'Screen/HomePage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'HomePage',
    routes: {
      'HomePage': (context) => const HomePage(),

    },
  ));
}
