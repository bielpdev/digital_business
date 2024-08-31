import 'dart:convert';

import 'package:digital_business/src/http_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('fetchInfo', () {
    test('deve retornar algum objeto', () async {
      final dio = MockDio();
      final repository = BusinessCardRepository(dio);

      when(() => dio.get(any())).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(
                path:
                    'https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/1'),
            data: jsonDecode(jsonData),
          ));

      final list = await repository.getUsertest();
      print(list);

      ///  print(list[1].twitter);
    });
  });
}

String jsonData = '''[
  {
    "id": "0",
    "name": "Gabriel Charamello",
    "jobArea": "Flutter Developer",
    "about": "I develop mobile applications using Flutter, focusing on intuitive interfaces and optimized performance.",
    "interest": "Mobile app development, UI/UX design, cutting-edge technology, games.",
    "avatar": "https://i.imgur.com/80MFeF8.png",
    "email": "gabriel.charamello@gmail.com",
    "facebook": "https://facebook.com/gabriel.chavosk",
    "instagram": "https://instagram.com/gaahinacio",
    "github": "https://github.com/bielpdev",
    "linkedin": "https://linkedin.com/in/gabriel-charamello-inacio-9538b3227/",
    "createdAt": "2024-08-23T11:12:12.601Z"
  }
]''';
