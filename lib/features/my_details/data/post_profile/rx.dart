import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../common_widgets/custom_toast.dart';
import '../../../../../../networks/rx_base.dart';
import 'api.dart';

final class PostProfileRx extends RxResponseInt {
  final api = PostProfileApi.instance;

  String message = "Something went wrong";

  PostProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get filleData => dataFetcher.stream;

  Future<bool> post({
    required String bio,
    required String location,
    required String website,
    required String phoneNumber,
    required String gender,
    required String dateOfBirth,
    required String facebook,
    required String instagram,
  }) async {
    try {
      Map<String, dynamic> data = {
        "bio": bio,
        "location": location,
        "website": website,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "socialLinks": {
          "facebook": facebook,
          "instagram": instagram,
        }
      };

      Map resdata = await api.postProfileApi(data);
      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log(data.toString());
    dataFetcher.sink.add(data);
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String message = 'Something went wrong';
    log(error.toString());
    if (error is DioException) {
      message = error.response?.data["message"].toString() ?? "Something went wrong";
      if (error.type == DioExceptionType.connectionError) {
        message = "Check Your Network Connection";
      }
    }
    customToastMessage('Error', message);
    return false;
  }
}