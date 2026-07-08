import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../../networks/dio/dio.dart';
import '../../../../../networks/endpoints.dart';
import '../../../../../networks/exception_handler/data_source.dart';

final class GetBestSellingApi {
  static final GetBestSellingApi _singleton = GetBestSellingApi._internal();
  GetBestSellingApi._internal();
  static GetBestSellingApi get instance => _singleton;

  Future<Map> getBestSellingData() async {
    try {
      Response response = await getHttp(EndPoints.bestSelling());
      if (response.statusCode == 200) {
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