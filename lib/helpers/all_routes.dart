import 'package:flutter/cupertino.dart';
import 'package:sashroy/features/auth/presentation/signup/signup_screen.dart';

import '../buttom_nav_bar.dart';
import '../features/auth/presentation/forgot_password_email/forgot_password_email_screen.dart';
import '../features/auth/presentation/forgot_password_set/forgot_set_password_screen.dart';
import '../features/auth/presentation/login/login_screen.dart';
import '../features/auth/presentation/forgot_verification/forgot_verifecation_screen.dart';
import '../features/auth/presentation/sign_up_email/sign_up_email_screen.dart';
import '../features/auth/presentation/sign_up_verify_email/sign_up_verify_email_screen.dart';
import '../features/details/presentaion/details_screen.dart';
import '../features/home/presentation/home.dart';
import '../features/notification/presintation/notification_screen.dart';
import '../features/save/presentation/save_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;
  static const String loginScreen = 'logIn';
  static const String signUpScreen = 'signUp';
  static const String forgotPasswordEmailScreen = 'ForgotPasswordEmai';
  static const String forgotSetPasswordScreen = 'ForgotSetPassword';
  static const String resetVerifecationScreen = 'ResetVerifecation';
  static const String signUpEmailScreen = 'SignUpEmail';
  static const String signUpVerificationScreen = 'SignUpVerification';
  static const String homeScreen = 'HomeScreen';
   static const String buttomNavBar = 'ButtomNavBar';
   static const String notificationScreen = 'NotificationScreen';
   static const String detailsScreen = 'DetailsScreen';
   static const String saveScreen = 'SaveScreen';
  
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static get defaultTargetPlatform => null;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes
      case Routes.loginScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const LoginScreen())
            : _FadedTransitionRoute(
                widget: const LoginScreen(), settings: settings);

      case Routes.signUpScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const SignupScreen())
            : _FadedTransitionRoute(
                widget: const SignupScreen(), settings: settings);

      case Routes.forgotPasswordEmailScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const ForgotPasswordEmailScreen())
            : _FadedTransitionRoute(
                widget: const ForgotPasswordEmailScreen(), settings: settings);
      case Routes.forgotSetPasswordScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const ForgotSetPasswordScreen())
            : _FadedTransitionRoute(
                widget: const ForgotSetPasswordScreen(), settings: settings);
      case Routes.resetVerifecationScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const ResetVerifecationScreen())
            : _FadedTransitionRoute(
                widget: const ResetVerifecationScreen(), settings: settings);
      case Routes.signUpEmailScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const SignUpEmailScreen())
            : _FadedTransitionRoute(
                widget: const SignUpEmailScreen(), settings: settings);
      case Routes.signUpVerificationScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const SignUpVerifyEmailScreen())
            : _FadedTransitionRoute(
                widget: const SignUpVerifyEmailScreen(), settings: settings);

case Routes.homeScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const HomeScreen())
            : _FadedTransitionRoute(
                widget: const HomeScreen(), settings: settings);
        case Routes.buttomNavBar:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const ButtomNavBar())
            : _FadedTransitionRoute(
                widget: const ButtomNavBar(), settings: settings);

                 case Routes.notificationScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const NotificationScreen())
            : _FadedTransitionRoute(
                widget: const NotificationScreen(), settings: settings);

      case Routes.detailsScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const DetailsScreen())
            : _FadedTransitionRoute(
                widget: const DetailsScreen(), settings: settings);


                 case Routes.saveScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const SaveScreen())
            : _FadedTransitionRoute(
                widget: const SaveScreen(), settings: settings);



      //   final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) => OtpScreen(email: args['email']))
      //       : _FadedTransitionRoute(
      //           widget: OtpScreen(email: args['email']), settings: settings);

      //  widget: const PropertyPhotosScreen(), settings: settings);

      // case Routes.propertyPhotosScreen2:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) => const PropertyPhotosScreen2())
      //       : _FadedTransitionRoute(
      //           widget: const PropertyPhotosScreen2(), settings: settings);

      // case Routes.propertyFillesScreen2:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) => const PropertyFillesScreen2())
      //       : _FadedTransitionRoute(
      //           widget: const PropertyFillesScreen2(), settings: settings);

      // case Routes.searchRopertiesScreen:
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) => const SearchRopertiesScreen())
      //       : _FadedTransitionRoute(
      //           widget: const SearchRopertiesScreen(), settings: settings);

      // case Routes.forgetOtpScreen:
      // final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) =>  ForgetOtpScreen(email: args["email"]))
      //       : _FadedTransitionRoute(
      //           widget:  ForgetOtpScreen(email: args["email"]), settings: settings);

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
