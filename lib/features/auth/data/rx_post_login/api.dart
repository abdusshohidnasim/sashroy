import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostloginApi {
  static final PostloginApi _singleton = PostloginApi._internal();
  PostloginApi._internal();
  static PostloginApi get instance => _singleton;

  Future<Map> postloginfunction(Map data) async {
    try {
      Response response = await postHttp(EndPoints.logIn(), data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map data = json.decode(json.encode(response.data));
        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      rethrow;
    }
  }
}
