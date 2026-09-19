import 'package:contact_app/common/app_colors.dart';
import 'package:contact_app/common/app_text_style.dart';
import 'package:contact_app/gen/assets.gen.dart';
import 'package:contact_app/models/contact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.contacts, required this.onDelete});

  final List<Contact> contacts;
  final ValueChanged<Contact> onDelete;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: contacts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 270,
      ),
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return _ContactCard(contact: contact, onDelete: () => onDelete(contact));
      },
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact, required this.onDelete});

  final Contact contact;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final infoStyle = AppTextStyle.styleS16f400.copyWith(
      fontSize: 12,
      color: AppColors.darkBlueColor,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: AppColors.primaryColor,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  contact.imageFile != null
                      ? Image.file(contact.imageFile!, fit: BoxFit.cover)
                      : Assets.images.imgPlaceholder.image(fit: BoxFit.cover),
                  Positioned(
                    left: 8,
                    bottom: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        contact.name,
                        style: AppTextStyle.styleS16f500.copyWith(
                          color: AppColors.darkBlueColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        size: 20,
                        color: AppColors.darkBlueColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          contact.email,
                          style: infoStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_in_talk,
                        size: 20,
                        color: AppColors.darkBlueColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          contact.phone,
                          style: infoStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete, size: 18),
                      label: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}
