import 'dart:io';

class Contact {
  const Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.imageFile,
  });

  final String name;
  final String email;
  final String phone;
  final File? imageFile;
}
