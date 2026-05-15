import 'package:rxdart/rxdart.dart';
import '../features/auth/data/rx_post_login/rx.dart';
import '../features/auth/data/rx_post_signup/rx.dart';
import '../features/user_profile/data/rx_get_profile/rx.dart';


PostLoginRx postLoginRxObj = PostLoginRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
PostSignupRx postSignupRxObj = PostSignupRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
GetProfileRx profileRxObj = GetProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
