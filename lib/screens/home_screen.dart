// Justification: StatelessWidget is chosen because this screen currently
// displays static content without mutable state or internal reactivity.

import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Persona persona = Persona.defaultValues();

    return Scaffold(
      appBar: AppBar(title: Text("DevProfile M3")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(persona.fullName),
                    Text(persona.email),
                    Text(
                      "${persona.birthDate.day}/${persona.birthDate.month}/${persona.birthDate.year}",
                    ),
                  ],
                ),
              ),
            ),
            // Spacing
            SizedBox(height: 20),
            // Action Buttons
            ElevatedButton(onPressed: () => {}, child: Text("Edit Profile")),
            ElevatedButton(
              onPressed: () => {},
              child: Text("Explore Widget Showcase"),
            ),
          ],
        ),
      ),
    );
  }
}
