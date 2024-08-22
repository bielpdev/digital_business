import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(85, 91, 90, 94),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageLogo(),
            bodyInfo(),
            aboutInfo(),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}

Widget imageLogo() {
  return Column(
    children: [
      ClipRRect(
        child: Image.network('https://i.ibb.co/pbk0JM8/Logo.jpg'),
      ),
    ],
  );
}

Widget bodyInfo() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Text(
              style: TextStyle(color: Colors.white, fontSize: 25),
              'Laura Smith'),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 7,
          ),
          child: Text(
              style: TextStyle(
                  color: Color.fromARGB(243, 241, 189, 121), fontSize: 12.8),
              'Frontend Developer'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
              style: TextStyle(
                  color: Color.fromARGB(245, 245, 245, 245), fontSize: 10.24),
              'laurasmith.website'),
        ),
        Padding(padding: EdgeInsets.only(top: 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 40,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text(style: TextStyle(color: Colors.black), 'Email'),
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.black,
                  side: BorderSide(style: BorderStyle.solid),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget aboutInfo() {
  return Center(
    child: Padding(
        padding: const EdgeInsets.only(
          top: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Container(
              width: 250,
              child: Text(
                'I am a frontend developer with a particular interest in making things simple and automating daily tasks. I try to keep up with security and best practices, and am always looking for new things to learn.',
                style: TextStyle(
                  color: Color.fromARGB(207, 193, 204, 202),
                  fontSize: 10.24,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Interest',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Container(
              width: 250,
              child: Text(
                'Food expert. Music scholar. Reader. Internet fanatic. Bacon buff. Entrepreneur. Travel geek. Pop culture ninja. Coffee fanatic.',
                style: TextStyle(
                  color: Color.fromARGB(207, 193, 204, 202),
                  fontSize: 10.24,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        )),
  );
}

Widget bottomBar() {
  return Container(
    width: 10,
    child: BottomAppBar(
      color: Color.fromARGB(66, 10, 1, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              'https://i.ibb.co/FshYH9Y/5.jpg',
              height: 25,
            ),
            Image.network(
              'https://i.ibb.co/2WCtYPG/4.jpg',
              height: 25,
            ),
            Image.network(
              'https://i.ibb.co/hDN5FS7/3.jpg',
              height: 25,
            ),
            Image.network(
              'https://i.ibb.co/PNHQFWX/2.jpg',
              height: 25,
            ),
            Image.network(
              'https://i.ibb.co/6Fwnk87/1.jpg',
              height: 25,
            ),
          ],
        ),
      ),
    ),
  );
}
