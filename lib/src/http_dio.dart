import 'package:digital_business/src/card_model.dart';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

class TodoRepository {
  Dio dio;

  TodoRepository([Dio? client]) : dio = client ?? Dio();

  Future<List<CardModel>> getUsertest() async {
    final response = await dio
        .get('https://5d85ccfb1e61af001471bf60.mockapi.io/businessCard/0');
    return (response.data as List)
        .map((json) => CardModel.fromJson(json))
        .toList();
  }
}
