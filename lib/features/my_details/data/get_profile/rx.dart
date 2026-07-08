import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sashroy/features/my_details/model/profile_model.dart';
import '../../../../../networks/rx_base.dart';
import '../../../../common_widgets/custom_toast.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/navigation_service.dart';
import 'api.dart';

final class GetProfileRx extends RxResponseInt {
  final api = GetProfileApi.instance;

  String message = "Something went wrong";

  GetProfileRx({required super.empty, required super.dataFetcher});

  ValueStream get fillData => dataFetcher.stream;

  Future<bool> fetchfunctionName() async {
    try {
      Map resdata = await api.getProfileData();
      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
  //  AppLogger.logger.w(data);
    // Model Mapping Section
    ProfileModel res = ProfileModel.fromJson(data);
    dataFetcher.sink.add(res);
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String message = 'Something went wrong';
   // AppLogger.logger.w(error.toString());
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
       // totalDataClean();
        appData.write(kKeyIsLoggedIn, false);
        NavigationService.navigateToUntilReplacement(Routes.loginScreen);
      } else {
        message = error.response?.data["message"].toString() ?? "Something went wrong";
      }
      if (error.type == DioExceptionType.connectionError) {
        message = "Check Your Network Connection";
      }
    }
    customToastMessage('Error', message);
    return false;
  }
}