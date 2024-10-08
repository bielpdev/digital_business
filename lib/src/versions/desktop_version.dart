import 'package:digital_business/src/model/card_model.dart';
import 'package:digital_business/src/repository/business_card_repository.dart';
import 'package:digital_business/src/widgets/imageLogoWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopVersion extends StatefulWidget {
  final BusinessCardRepository repository;

  const DesktopVersion({
    super.key,
    required this.repository,
  });

  @override
  State<DesktopVersion> createState() => _DesktopVersionState();
}

class _DesktopVersionState extends State<DesktopVersion> {
  late final Future<CardModel> _future;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _future = widget.repository.getUser();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.idle) {
          showBtmApp = false;
          setState(() {});
        } else {
          showBtmApp = true;
          setState(() {});
        }
      },
    );
  }

  bool showBtmApp = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      width: 868,
      child: Scaffold(
        backgroundColor: const Color(0xff23252C),
        body: Center(
          child: Container(
            height: 780,
            width: 317,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xff1A1B21)),
            child: FutureBuilder<CardModel>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  var model = snapshot.data!;
                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageLogoWidget(model),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Center(
                              child: Text(
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                                model.name,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 7),
                            child: Center(
                              child: Text(
                                model.jobArea,
                                style: GoogleFonts.inter(
                                  color: const Color(0xffF3BF99),
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Text(
                                model.email,
                                style: GoogleFonts.inter(
                                  color: const Color(0xffF5F5F5),
                                  fontSize: 10.24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 115,
                              height: 34,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  widget.repository.launchLink(
                                      'https://mail.google.com/mail/u/0/#inbox?compose=XBcJlCFWWfhdsPTQclZRJKhqHFfFvWSGtDnmMvhWmjkBRdpQPTSMVXKrpLnGTPmJCSZSCqRxZtFvqfzG');
                                },
                                label: Text(
                                  style: GoogleFonts.inter(color: Colors.black),
                                  'Email',
                                ),
                                icon: Image.asset('lib/icons/Icon (2).png'),
                                style: ElevatedButton.styleFrom(
                                  iconColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      color: Color(0xffD1D5DB),
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                            SizedBox(
                              height: 36,
                              child: SizedBox(
                                width: 115,
                                height: 34,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      widget.repository
                                          .launchLink(model.linkedin);
                                    },
                                    label: Text(
                                      'Linkedin',
                                      style: GoogleFonts.inter(
                                          color: Colors.white),
                                    ),
                                    icon: SvgPicture.asset(
                                        'lib/icons/linkedin.svg'),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(5),
                                      iconColor: Colors.black,
                                      backgroundColor: const Color(0xff5093E2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        AboutInfoWidget(model),
                        const SizedBox(
                          height: 99,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          child: FutureBuilder<CardModel>(
                            future: _future,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData)
                                return const SizedBox.shrink();
                              return AnimatedContainer(
                                  duration: const Duration(milliseconds: 700),
                                  curve: Curves.easeInOutSine,
                                  height: showBtmApp ? 70 : 10,
                                  child: BottomBarWidget(
                                      snapshot.data!, widget.repository));
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AboutInfoWidget extends StatelessWidget {
  AboutInfoWidget(this.model, {super.key});
  final CardModel model;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'About',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width,

              // width: 250,
              child: Center(
                child: Text(
                  model.about,
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(207, 193, 204, 202),
                    fontSize: 10.24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  'Interests',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  model.interest,
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(207, 193, 204, 202),
                    fontSize: 10.24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

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
