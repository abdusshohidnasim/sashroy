import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common_widgets/not_found_widget.dart';
import '../features/auth/presentation/login.dart';
import '../features/auth/presentation/signup.dart';
import '../features/user_profile/presentation/profile.dart';
import '../loading_screen.dart';
import 'all_routes.dart';
import 'navigation_service.dart';

final class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: Routes.root,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.root,
        name: 'root',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: const Loading(),
        ),
      ),
      GoRoute(
        path: Routes.loginScreen,
        name: 'login',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.signUpScreen,
        name: 'signUp',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: Routes.profile,
        name: 'profile',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: const ProfileScreen(),
        ),
      ),

      // Placeholders (until real screens are implemented)
      GoRoute(
        path: Routes.forgotPWScreen,
        name: 'forgotPassword',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: const _TodoScreen(title: 'Forgot Password'),
        ),
      ),
      GoRoute(
        path: Routes.otpScreen,
        name: 'otp',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: _TodoScreen(title: 'OTP', extra: state.extra),
        ),
      ),
      GoRoute(
        path: Routes.setPassword,
        name: 'setPassword',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: _TodoScreen(title: 'Set Password', extra: state.extra),
        ),
      ),
      GoRoute(
        path: Routes.productsScreen,
        name: 'products',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: _TodoScreen(title: 'Products', extra: state.extra),
        ),
      ),
      GoRoute(
        path: Routes.productsWithPagination,
        name: 'productsWithPagination',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: _TodoScreen(
            title: 'Products With Pagination',
            extra: state.extra,
          ),
        ),
      ),
      GoRoute(
        path: Routes.productDetailsScreen,
        name: 'productDetails',
        pageBuilder: (context, state) => _platformPage(
          state: state,
          child: _TodoScreen(title: 'Product Details', extra: state.extra),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => _platformPage(
      state: state,
      child: const Scaffold(
        body: NotFoundWidget(),
      ),
    ),
  );

  static Page<T> _platformPage<T>({
    required GoRouterState state,
    required Widget child,
  }) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPage<T>(
        key: state.pageKey,
        child: child,
      );
    }

    return CustomTransitionPage<T>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 1),
      reverseTransitionDuration: const Duration(milliseconds: 1),
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
}

class _TodoScreen extends StatelessWidget {
  final String title;
  final Object? extra;

  const _TodoScreen({
    required this.title,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    final message = extra == null
        ? '$title screen is not implemented yet.'
        : '$title screen is not implemented yet.\n\nExtra: $extra';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
