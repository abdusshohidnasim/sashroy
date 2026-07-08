import 'package:rxdart/rxdart.dart';
import 'package:sashroy/features/auth/data/rx_post_signup/rx.dart';
import '../features/auth/data/rx_post_login/rx.dart';
import '../features/auth/data/rx_post_resent/rx.dart';
import '../features/auth/data/rx_post_signup_email_verified/rx.dart';
import '../features/home/data/get_bestselling/rx.dart';
import '../features/home/data/recent_activity/rx.dart';
import '../features/my_details/data/get_profile/rx.dart';
import '../features/my_details/data/post_profile/rx.dart';

PostloginRx postLoginRxObj =
    PostloginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostsignupRx postSignupRxObj =
    PostsignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostSignUpVerifyRx postSignUpVerifyRxObj =
    PostSignUpVerifyRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

PostResentRx postResentRxObj =
    PostResentRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

GetBestSellingRx getBestSellingRxObj =
    GetBestSellingRx(empty: {}, dataFetcher: BehaviorSubject());

GetRecentActivityRx getRecentActivityRxObj =
    GetRecentActivityRx(empty: {}, dataFetcher: BehaviorSubject());

GetProfileRx getProfileRxObj =
    GetProfileRx(empty: {}, dataFetcher: BehaviorSubject());

PostProfileRx postProfileRxObj =
    PostProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

