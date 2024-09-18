import 'package:digital_business/src/desktop_version.dart';
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
  choiceDevice() {
    final Size screenSize = MediaQuery.sizeOf(context);
    final double screenWidth = screenSize.width;
    //final double screenHeight = screenSize.height;
    if (screenWidth >= 1200) {
      runApp(MaterialApp(
          home: DesktopVersion(repository: BusinessCardRepository())));
    } else if (screenWidth < 1200) {
      runApp(
          MaterialApp(home: UserProfile(repository: BusinessCardRepository())));
    }
  }

  final repository = BusinessCardRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          choiceDevice() ?? const Text('Ocorreu algum erro'),
        ],
      ),
    );
  }
}
