import 'dart:convert';

import 'package:digital_business/src/card_model.dart';
import 'package:http/http.dart' as http;

Future<List<CardModel>> getUser() async {
  var url =
      Uri.parse('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var x = jsonDecode(response.body);
    return CardModel.fromJsonList(x);
  } else {
    throw Exception('');
  }
}
