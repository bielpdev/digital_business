import 'package:digital_business/src/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutInfoWidget extends StatelessWidget {
  AboutInfoWidget(this.model, {super.key});
  final CardModel model;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                child: SizedBox(
                  width: 290,
                  child: Text(
                    model.about,
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(207, 193, 204, 202),
                      fontSize: 10.24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
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

              // width: 250,
              child: Center(
                child: SizedBox(
                  width: 290,
                  child: Text(
                    model.interest,
                    style: GoogleFonts.inter(
                      color: const Color.fromARGB(207, 193, 204, 202),
                      fontSize: 10.24,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
