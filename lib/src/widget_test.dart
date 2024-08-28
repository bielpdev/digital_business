import 'package:digital_business/src/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterWidget extends StatelessWidget {
  const TwitterWidget(this.model, {super.key});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (model.twitter.isNotEmpty)
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.only(left: 30),
            ),
            onPressed: () {
              canLaunchUrl(Uri.parse(model.twitter));
            },
            child: SvgPicture.asset('lib/icons/Twitter.svg'),
          ),
      ],
    );
  }
}
