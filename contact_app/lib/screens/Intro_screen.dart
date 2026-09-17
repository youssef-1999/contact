import 'package:contact_app/common/app_colors.dart';
import 'package:contact_app/common/app_text_style.dart';
import 'package:contact_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
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
        child: Center(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}