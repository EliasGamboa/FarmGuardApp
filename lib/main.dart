import 'package:farm_guard/Screens/areas.dart';
import 'package:farm_guard/Screens/incidencia.dart';
import 'package:farm_guard/Screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      'login': (context) => const Login(),
      'incidencia': (context) => const Incidencia(),
      'area': (context) => const Area(),
    },
    initialRoute: 'login',
  ));
}
