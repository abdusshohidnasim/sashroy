import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class PostSignUpVerifyApi {
  static final PostSignUpVerifyApi _singleton = PostSignUpVerifyApi._internal();
  PostSignUpVerifyApi._internal();
  static PostSignUpVerifyApi get instance => _singleton;

  Future<Map> postSignupVerify(Map data) async {
    try {
      Response response = await postHttp(EndPoints.signUpEmailVerify(), data);
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