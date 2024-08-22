import 'package:digital_business/src/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const StartPage(),
    ),
  );
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProfile();
  }
}
