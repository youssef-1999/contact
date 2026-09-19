import 'package:contact_app/common/app_colors.dart';
import 'package:contact_app/common/app_text_style.dart';
import 'package:contact_app/gen/assets.gen.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/screens/form_screen.dart';
import 'package:contact_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool isShowForm=false;
  final List<Contact> contacts = [];

  void _deleteContact(Contact contact) {
    setState(() {
      contacts.remove(contact);
    });
  }

  void _deleteAllContacts() {
    setState(() {
      contacts.clear();
    });
  }

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
      isShowForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlueColor,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlueColor,
        elevation: 0,
        title: Image.asset(Assets.images.routeLogo.path, height: 50),
      ),
      body: SafeArea(
        child: isShowForm
            ? FormScreen(onSubmit: _addContact)
            : contacts.isNotEmpty
            ? HomeScreen(contacts: contacts, onDelete: _deleteContact)
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.images.emptyList.path, height: 200),
                    SizedBox(height: 20),
                    Text(
                      'There is No Contacts Added Here',
                      style: AppTextStyle.styleS16f400.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contacts.isNotEmpty && !isShowForm) ...[
            FloatingActionButton(
              heroTag: 'deleteAll',
              backgroundColor: AppColors.redColor,
              foregroundColor: Colors.white,
              tooltip: 'Delete all',
              onPressed: _deleteAllContacts,
              child: const Icon(Icons.delete_sweep),
            ),
            const SizedBox(height: 16),
          ],
          FloatingActionButton(
            heroTag: 'addContact',
            backgroundColor: AppColors.primaryColor,
            child: Icon(isShowForm ? Icons.close : Icons.add),
            onPressed: () {
              setState(() {
                isShowForm = !isShowForm;
              });
            },
          ),
        ],
      ),
    );
  }
}