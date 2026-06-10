import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostResentApi {
  static final PostResentApi _singleton = PostResentApi._internal();
  PostResentApi._internal();
  static PostResentApi get instance => _singleton;

  Future<Map> postResent(Map data) async {
    try {
      Response response = await postHttp(EndPoints.resend(), data);
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