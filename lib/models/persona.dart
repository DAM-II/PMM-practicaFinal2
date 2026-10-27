class Persona {
  String firstName;
  String lastName;
  String email;
  String password;
  DateTime birthDate;

  Persona({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.birthDate,
  });

  Persona.defaultValues()
    : firstName = "John",
      lastName = "Doe",
      email = "johndoe@example.com",
      password = "Password123",
      birthDate = DateTime(2000, 1, 1);

  String get fullName => '$firstName $lastName';
}
