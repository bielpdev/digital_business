import 'package:digital_business/src/card_model.dart';
import 'package:digital_business/src/http_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final Future<CardModel> _future = getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(85, 91, 90, 94),
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
            return Column(children: [
              ImageLogoWidget(model),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                  model.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  model.jobArea,
                  style: GoogleFonts.inter(
                    color: const Color(0xffF3BF99),
                    fontSize: 12.8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  model.email,
                  style: GoogleFonts.inter(
                    color: const Color(0xffF5F5F5),
                    fontSize: 10.24,
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
                      onPressed: () {},
                      label: Text(
                        style: GoogleFonts.inter(color: Colors.black),
                        'Email',
                      ),
                      icon: Image.asset('lib/icons/Icon (2).png'),
                      //   icon: Image.network('https://i.ibb.co/4FJtJwX/ae.jpg'),
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
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: Text(
                          style: GoogleFonts.inter(color: Colors.white),
                          'Linkedin',
                        ),
                        icon: SvgPicture.asset('lib/icons/linkedin.svg'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(5),
                          iconColor: Colors.black,
                          backgroundColor: const Color(0xff5093E2),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              //  color: Color(0xffD1D5DB),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AboutInfoWidget(model),
              //   BottomBarWidget(model),
            ]);
          }
        },
      ),
      bottomNavigationBar: FutureBuilder<CardModel>(
        future: getUser(),
        builder: (context, snapshot) {
          return barBottomWidgets(context, snapshot);
        },
      ),
    );
  }
}

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget(this.model, {super.key});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.network(model.picture),
        ),
      ],
    );
  }
}

class AboutInfoWidget extends StatelessWidget {
  const AboutInfoWidget(this.model, {super.key});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              SizedBox(
                width: 250,
                child: Text(
                  model.about,
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(207, 193, 204, 202),
                    fontSize: 10.24,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text('Interests',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  )
                  // TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.w700,
                  // ),
                  ),
              const SizedBox(height: 2),
              SizedBox(
                width: 250,
                child: Text(
                  model.interest,
                  style: GoogleFonts.inter(
                    color: const Color.fromARGB(207, 193, 204, 202),
                    fontSize: 10.24,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget(this.model, {super.key});
  final CardModel model;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff161619),
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WidgetStateColor.transparent,
                padding: const EdgeInsets.only(
                  left: 30,
                ), // Ajuste o preenchimento conforme necessário
              ),
              onPressed: () {},
              child: SvgPicture.asset('lib/icons/Twitter.svg'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WidgetStateColor.transparent,
                padding: const EdgeInsets.only(
                    left: 30), // Ajuste o preenchimento conforme necessário
              ),
              onPressed: () => launcherLink(model.instagram),
              child: SvgPicture.asset('lib/icons/Facebook.svg'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WidgetStateColor.transparent,
                padding: const EdgeInsets.only(
                    left: 30), // Ajuste o preenchimento conforme necessário
              ),
              onPressed: () => launcherLink(model.instagram),
              child: SvgPicture.asset('lib/icons/Instagram.svg'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WidgetStateColor.transparent,
                padding: const EdgeInsets.only(
                    left: 30), // Ajuste o preenchimento conforme necessário
              ),
              onPressed: () {},
              child: SvgPicture.asset('lib/icons/Github.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget barBottomWidgets(
    BuildContext context, AsyncSnapshot<CardModel> snapshot) {
  if (!snapshot.hasData || snapshot.data == null) {
    return const SizedBox
        .shrink(); // Retorna um widget vazio se não houver dados
  }

  var model = snapshot.data!;
  return BottomAppBar(
    color: const Color(0xff161619),
    child: Padding(
      padding: const EdgeInsets.only(right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
          if (model.facebook.isNotEmpty)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.only(left: 30),
              ),
              onPressed: () => launcherLink(model.facebook),
              child: SvgPicture.asset('lib/icons/Facebook.svg'),
            ),
          if (model.instagram.isNotEmpty)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.only(left: 30),
              ),
              onPressed: () => launcherLink(model.instagram),
              child: SvgPicture.asset('lib/icons/Instagram.svg'),
            ),
          if (model.github.isNotEmpty)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.only(left: 30),
              ),
              onPressed: () => launcherLink(model.github),
              child: SvgPicture.asset('lib/icons/Github.svg'),
            ),
        ],
      ),
    ),
  );
}
