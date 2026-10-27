import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';

class ProfileCard extends StatelessWidget {
  final Persona persona;

  const ProfileCard({super.key, required this.persona});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(persona.fullName),
            SizedBox(height: 8),
            Text(persona.email),
            SizedBox(height: 8),
            Text(
              "${persona.birthDate.day}/${persona.birthDate.month}/${persona.birthDate.year}",
            ),
          ],
        ),
      ),
    );
  }
}
