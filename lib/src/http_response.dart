import 'dart:convert';

import 'package:digital_business/src/card_model.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<CardModel> getUser() async {
  var url =
      Uri.parse('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/0');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var x = jsonDecode(response.body);
    return CardModel.fromJson(x);
  } else {
    throw Exception('Erro ao receber os dados');
  }
}

Future<void> launcherLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launch(url, forceWebView: false, forceSafariVC: false);
  } else {
    print('Error para realizar a ação');
  }
}
