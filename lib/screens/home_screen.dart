// Justification: StatelessWidget is chosen because this screen currently
// displays static content without mutable state or internal reactivity.

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
