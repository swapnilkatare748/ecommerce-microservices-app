import 'package:flutter/material.dart';
import 'package:feedbackdesign/uikit/roptia_ui_kit.dart'; // Ensure PremiumPurpleBackground is exported from here

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: const PremiumPurpleBackground(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: kToolbarHeight + 60),
            child: Text(
              'Welcome to the Home Screen!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
