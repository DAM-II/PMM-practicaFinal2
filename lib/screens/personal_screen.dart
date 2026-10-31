// Justification: StatefulWidget is chosen because this screen manages mutable form state via TextEditingControllers

import 'package:flutter/material.dart';
import 'package:pf2/models/persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;

  const PersonalScreen({super.key, required this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _loadPersonaData();
  }

  void _loadPersonaData() {
    firstNameController.text = widget.persona.firstName;
    lastNameController.text = widget.persona.lastName;
    emailController.text = widget.persona.email;
    passwordController.text = widget.persona.password;
    selectedDate = widget.persona.birthDate;
    birthDateController.text =
        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        birthDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _saveAndReturn() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        selectedDate == null) {
      return;
    }

    Persona updatedPersona = Persona(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      password: passwordController.text,
      birthDate: selectedDate!,
    );

    Navigator.pop(context, updatedPersona);
  }

  TextField _buildTextField(
    String label,
    TextEditingController controller, {
    bool isEmail = false,
    bool isPassword = false,
    bool isCapitalised = false,
    bool isReadOnly = false,
    onTap = null,
  }) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      onTap: onTap,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      textCapitalization: isCapitalised
          ? TextCapitalization.words
          : TextCapitalization.none,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo")),
      body: (SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(
              "First Name",
              firstNameController,
              isCapitalised: true,
            ),
            SizedBox(height: 12),
            _buildTextField("Last Name", lastNameController),
            SizedBox(height: 12),
            _buildTextField("Email", emailController, isEmail: true),
            SizedBox(height: 12),
            _buildTextField("Password", passwordController, isPassword: true),
            SizedBox(height: 12),
            _buildTextField(
              "Date of Birth",
              birthDateController,
              isReadOnly: true,
              onTap: _pickDate,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _saveAndReturn,
              child: Text("Save and Return"),
            ),
          ],
        ),
      )),
    );
  }
}
