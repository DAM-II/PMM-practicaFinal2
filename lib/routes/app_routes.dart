import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';
import 'package:pf2/screens/home_screen.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/screens/widget_screen.dart';

class AppRoutes {
  static const String initialRoute = '/home';

  static Map<String, WidgetBuilder> routes = {
    '/home': (context) => HomeScreen(),
    '/personal': (context) => PersonalScreen(persona: Persona.defaultValues()),
    '/widget': (context) => WidgetScreen(),
  };
}
