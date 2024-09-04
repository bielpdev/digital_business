import 'package:digital_business/src/user_profile.dart';
import 'package:flutter/material.dart';

import 'src/business_card_repository.dart';

void main() {
  runApp(const StartPage());
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final repository = BusinessCardRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfile(
        repository: repository,
      ),
    );
  }
}
