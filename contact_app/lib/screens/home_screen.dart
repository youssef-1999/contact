import 'package:contact_app/common/app_colors.dart';
import 'package:contact_app/common/app_text_style.dart';
import 'package:contact_app/gen/assets.gen.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: contact.imageFile != null
                ? FileImage(contact.imageFile!)
                : null,
            child: contact.imageFile == null
                ? Assets.images.imgPlaceholder.image()
                : null,
          ),
          title: Text(
            contact.name,
            style: AppTextStyle.styleS16f500.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
