import 'package:digital_business/src/card_model.dart';
import 'package:digital_business/src/http_response.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(85, 91, 90, 94),
      body: FutureBuilder<List<CardModel>>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(children: [
                  imageLogo(context, index, snapshot),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        snapshot.data![index].name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: Text(
                        style: TextStyle(
                            color: Color.fromARGB(243, 241, 189, 121),
                            fontSize: 12.8),
                        snapshot.data![index].jobArea),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                        style: TextStyle(
                            color: Color.fromARGB(245, 245, 245, 245),
                            fontSize: 10.24),
                        snapshot.data![index].email),
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
                          label: Text(
                              style: TextStyle(color: Colors.black), 'Email'),
                          icon: Icon(Icons.email),
                          style: ElevatedButton.styleFrom(
                            iconColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  aboutInfo(context, index, snapshot),
                ]);
              },
            );
          } else {
            return Center(child: Text('Nenhum dado disponível'));
          }
        },
      ),
      bottomNavigationBar: bottomBar(),
    );
  }
}

Widget imageLogo(
    BuildContext context, index, AsyncSnapshot<List<CardModel>> snapshot) {
  return Column(
    children: [
      ClipRRect(
        child: Image.network(snapshot.data![index].picture),
      ),
    ],
  );
}

Widget aboutInfo(
    BuildContext context, index, AsyncSnapshot<List<CardModel>> snapshot) {
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
                snapshot.data![index].about,
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
              'Interests',
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
                snapshot.data![index].interest,
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
