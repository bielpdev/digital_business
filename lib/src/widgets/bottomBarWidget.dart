import 'package:digital_business/src/model/card_model.dart';
import 'package:digital_business/src/repository/business_card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget(this.model, this.repository, {super.key});
  final CardModel model;
  final BusinessCardRepository repository;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8.0,
      shape: const CircularNotchedRectangle(),
      color: const Color(0xff161619),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (model.twitter.isNotEmpty)
              MouseRegion(
                key: const ValueKey('twitter-button'),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => repository.launchLink(model.twitter),
                  child: SvgPicture.asset('lib/icons/twitter.svg'),
                ),
              ),
            if (model.facebook.isNotEmpty) ...[
              const Padding(padding: EdgeInsets.all(10)),
              MouseRegion(
                key: const ValueKey('facebook-button'),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => repository.launchLink(model.facebook),
                  child: SvgPicture.asset('lib/icons/Facebook.svg'),
                ),
              ),
            ],
            if (model.instagram.isNotEmpty) ...[
              const Padding(padding: EdgeInsets.all(10)),
              MouseRegion(
                key: const ValueKey('instagram-button'),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => repository.launchLink(model.instagram),
                  child: SvgPicture.asset('lib/icons/Instagram.svg'),
                ),
              ),
            ],
            if (model.linkedin.isNotEmpty) ...[
              const Padding(padding: EdgeInsets.all(10)),
              MouseRegion(
                key: const ValueKey('linkedin-button'),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => repository.launchLink(model.linkedin),
                  child: SvgPicture.asset('lib/icons/LinkedinIcon.svg'),
                ),
              ),
            ],
            if (model.github.isNotEmpty) ...[
              const Padding(padding: EdgeInsets.all(10)),
              MouseRegion(
                key: const ValueKey('github-button'),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => repository.launchLink(model.github),
                  child: SvgPicture.asset('lib/icons/Github.svg'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
