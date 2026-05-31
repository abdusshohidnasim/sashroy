import 'package:rxdart/rxdart.dart';
import 'package:sashroy/features/auth/data/rx_post_signup/rx.dart';
import '../features/auth/data/rx_post_login/rx.dart';



PostloginRx postLoginRxObj = PostloginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostsignupRx postSignupRxObj = PostsignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
//PostSignupRx postSignupRxObj = PostSignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
// GetProfileRx profileRxObj = GetProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

