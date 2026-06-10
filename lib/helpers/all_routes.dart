import 'package:flutter/cupertino.dart';
import 'package:sashroy/features/auth/presentation/signup/signup_screen.dart';
import 'package:sashroy/features/help_center/presentations/help_center_screen.dart';
import 'package:sashroy/features/my_orders/presentations/my_orders_top_bar.dart';

import '../buttom_nav_bar.dart';
import '../features/account/presentation/account_screen.dart';
import '../features/address/presentation/address_selection_screen.dart';
import '../features/auth/presentation/forgot_password_email/forgot_password_email_screen.dart';
import '../features/auth/presentation/forgot_password_set/forgot_set_password_screen.dart';
import '../features/auth/presentation/login/login_screen.dart';
import '../features/auth/presentation/forgot_verification/forgot_verifecation_screen.dart';
import '../features/auth/presentation/sign_up_email/sign_up_email_screen.dart';
import '../features/auth/presentation/sign_up_verify_email/sign_up_verify_email_screen.dart';
import '../features/check_out/presentations/check_out_screen.dart';
import '../features/details/presentaion/details_screen.dart';
import '../features/home/presentation/home.dart';
import '../features/my_details/presentations/my_details_screen.dart';
import '../features/notification/presintation/notification_screen.dart';
import '../features/payment_validation/presentation/payment_validation_screen.dart';
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
  static const String checkOutScreen = 'CheckOutScreen';
  static const String addressSelectionScreen = 'AddressSelectionScreen';
  static const String paymentValidationScreen = 'PaymentValidationScreen';
  static const String accountScreen = 'Account';
  static const String myOrdersTopBar = 'MyOrdersTopBar';
  static const String myDetailsScreen = 'MyDetails';
  static const String helpCenterScreen = 'HelpCenterScreen';
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


                  // case Routes.forgetOtpScreen:
      // final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) =>  ForgetOtpScreen(email: args["email"]))
      //       : _FadedTransitionRoute(
      //           widget:  ForgetOtpScreen(email: args["email"]), settings: settings);



      case Routes.signUpVerificationScreen:
      final args = settings.arguments as Map;
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) =>  SignUpVerifyEmailScreen(email: args["email"]))
            : _FadedTransitionRoute(
                widget: SignUpVerifyEmailScreen(email: args["email"]), settings: settings);

      case Routes.homeScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const HomeScreen())
            : _FadedTransitionRoute(
                widget: const HomeScreen(), settings: settings);
      case Routes.buttomNavBar:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const ButtomNavBar())
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
            ? CupertinoPageRoute(builder: (context) => const DetailsScreen())
            : _FadedTransitionRoute(
                widget: const DetailsScreen(), settings: settings);

      case Routes.saveScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const SaveScreen())
            : _FadedTransitionRoute(
                widget: const SaveScreen(), settings: settings);

      case Routes.checkOutScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const CheckOutScreen())
            : _FadedTransitionRoute(
                widget: const CheckOutScreen(), settings: settings);

      case Routes.addressSelectionScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const AddressSelectionScreen())
            : _FadedTransitionRoute(
                widget: const AddressSelectionScreen(), settings: settings);

      case Routes.paymentValidationScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(
                builder: (context) => const PaymentValidationScreen())
            : _FadedTransitionRoute(
                widget: const PaymentValidationScreen(), settings: settings);

      case Routes.accountScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const AccountScreen())
            : _FadedTransitionRoute(
                widget: const AccountScreen(), settings: settings);



      case Routes.myOrdersTopBar:
        return defaultTargetPlatform == TargetPlatform.iOS
            ? CupertinoPageRoute(builder: (context) => const MyOrdersTopBar())
            : _FadedTransitionRoute(
                widget: const MyOrdersTopBar(), settings: settings);

         
      case Routes.myDetailsScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoPageRoute(builder: (context) => MyDetailsScreen())
            : _FadedTransitionRoute(
            widget: MyDetailsScreen(), settings: settings);


      case Routes.helpCenterScreen:
        return defaultTargetPlatform == TargetPlatform.iOS
          ? CupertinoPageRoute(builder: (context) => const HelpCenterScreen())
            : _FadedTransitionRoute(
            widget: const HelpCenterScreen(), settings: settings);

      //   final args = settings.arguments as Map;
      //   return defaultTargetPlatform == TargetPlatform.iOS
      //       ? CupertinoPageRoute(
      //           builder: (context) => OtpScreen(email: args['email']))
      //       : _FadedTransitionRoute(
      //           widget: OtpScreen(email: args['email']), settings: settings);

      //  widget: const PropertyPhotosScreen(), settings: settings);

    

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
