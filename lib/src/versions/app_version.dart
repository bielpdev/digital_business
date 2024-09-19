import 'package:digital_business/src/model/card_model.dart';
import 'package:digital_business/src/repository/business_card_repository.dart';
import 'package:digital_business/src/versions/desktop_version.dart';
import 'package:digital_business/src/widgets/imageLogoWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  final BusinessCardRepository repository;

  const UserProfile({
    super.key,
    required this.repository,
  });

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late final Future<CardModel> _future;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _future = widget.repository.getUser();
    _scrollController.addListener(
      () {
        if (_scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
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
    return Scaffold(
      backgroundColor: const Color(0xff1A1B21),
      body: FutureBuilder<CardModel>(
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
                  const SizedBox(height: 12),
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
                                widget.repository.launchLink(model.linkedin);
                              },
                              label: Text(
                                'Linkedin',
                                style: GoogleFonts.inter(color: Colors.white),
                              ),
                              icon: SvgPicture.asset('lib/icons/linkedin.svg'),
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
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: FutureBuilder<CardModel>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOutSine,
              height: showBtmApp ? 70 : 0,
              child: BottomBarWidget(snapshot.data!, widget.repository));
        },
      ),
    );
  }
}
