// Justification: StatefulWidget is chosen because this screen maintains mutable state (the Persona profile)
// and must trigger a UI rebuild via setState() when updated data is returned from PersonalScreen.

import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';
import 'package:pf2/screens/personal_screen.dart';
import 'package:pf2/widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Persona _persona = Persona.defaultValues();

  void _navigateToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalScreen(persona: _persona),
      ),
    );

    if (result is Persona) {
      setState(() {
        _persona = result;
      });
    }
  }

  // navigate to widget showcase
  void _navigateToWidgetShowcase() {
    Navigator.pushNamed(context, '/widget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DevProfile M3")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            ProfileCard(persona: _persona),
            SizedBox(height: 20),
            // Action Buttons
            ElevatedButton(
              onPressed: _navigateToEditProfile,
              child: const Text("Edit Profile"),
            ),
            ElevatedButton(
              onPressed: _navigateToWidgetShowcase,
              child: Text("Explore Widget Showcase"),
            ),
          ],
        ),
      ),
    );
  }
}
