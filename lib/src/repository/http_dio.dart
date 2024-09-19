import 'package:digital_business/src/model/card_model.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

class BusinessCardRepository {
  Dio dio;

  BusinessCardRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<CardModel>> getUsertest() async {
    final response = await dio
        .get('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/1');
    return (response.data as List)
        .map((json) => CardModel.fromJson(json))
        .toList();
  }
}
