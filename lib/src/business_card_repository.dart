import 'dart:convert';

import 'package:digital_business/src/card_model.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

//TODO: Pesquisar sobre repository pattern
class BusinessCardRepository {
  Future<CardModel> getUser() async {
    var loca = CardModel(
      about: '',
      email: '',
      facebook: '',
      github: '',
      instagram: '',
      interest: '',
      jobArea: '',
      name: '',
      picture: '',
      twitter: '',
    );

    http.Response response = await http.get(Uri.parse(
            'https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/$queyParams')
        .replace(queryParameters: queyParams));

    // var url =
    //      Uri.parse('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/');
    // http.Response response = await http.get(
    //     Uri.parse('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/')
    //       .replace(queryParameters: url));
    if (response.statusCode == 200) {
      var x = jsonDecode(response.body);
      return CardModel.fromJson(x);
    } else {
      throw Exception('Erro ao receber os dados');
    }
  }

  final Map<String, dynamic> queyParams = {"id": "0"};

  Future<void> launchLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Error para realizar a ação');
    }
  }
}
