import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../networks/rx_base.dart';
import '../../../../common_widgets/custom_toast.dart';
import '../../../../constants/app_constants.dart';
import '../../../../helpers/all_routes.dart';
import '../../../../helpers/di.dart';
import '../../../../helpers/navigation_service.dart';
import '../../model/recent_producted_model.dart';
import 'api.dart';

final class GetRecentActivityRx extends RxResponseInt {
  final api = GetRecentActivityApi.instance;

  String message = "Something went wrong";

  GetRecentActivityRx({required super.empty, required super.dataFetcher});

  ValueStream get fillData => dataFetcher.stream;

  Future<bool> fetchfunctionName() async {
    try {
      Map resdata = await api.getRecentActivityData();
      return await handleSuccessWithReturn(resdata);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
  //  AppLogger.logger.w(data);
    // Model Mapping Section
    RecentProductsModel res = RecentProductsModel.fromJson(data);
    dataFetcher.sink.add(res);
    return true;
  }

  @override
  handleErrorWithReturn(error) {
    String message = 'Something went wrong';
   // AppLogger.logger.w(error.toString());
    if (error is DioException) {
      if (error.response?.statusCode == 401) {
        //totalDataClean();
        appData.write(kKeyIsLoggedIn, false);
        NavigationService.navigateToReplacement(Routes.loginScreen);
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