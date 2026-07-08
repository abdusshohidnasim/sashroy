import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../../networks/dio/dio.dart';
import '../../../../../../networks/endpoints.dart';
import '../../../../../../networks/exception_handler/data_source.dart';

final class PostProfileApi {
  static final PostProfileApi _singleton = PostProfileApi._internal();
  PostProfileApi._internal();
  static PostProfileApi get instance => _singleton;

  Future<Map> postProfileApi(Map data) async {
    try {
      Response response = await postHttp(EndPoints.postProfile(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map result = json.decode(json.encode(response.data));
        return result;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}