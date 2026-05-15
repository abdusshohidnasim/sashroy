import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavigationService {
  static final NavigationService _navigationService =
      NavigationService._internal();
  NavigationService._internal();
  static NavigationService get instance => _navigationService;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get _context => navigatorKey.currentContext!;
  static GoRouter get _router => GoRouter.of(_context);

  static Future<dynamic> navigateTo(String routeName) => _router.push(routeName);

    static Future<dynamic> navigateToReplacement(String routeName) =>
      _router.pushReplacement(routeName);

  static Future<dynamic> popAndReplace(String routeName) async {
    if (_router.canPop()) {
      _router.pop();
    }
    return await _router.push(routeName);
  }

  static Future<dynamic> navigateToUntilReplacement(String routeName) async {
    _router.go(routeName);
    return null;
  }

  static Future<dynamic> navigateToWithArgs(
    String routeName,
    Map<String, dynamic>? map,
  ) =>
      _router.push(routeName, extra: map);

  static Future<dynamic> popAndReplaceWihArgs(
          String routeName, Map<String, dynamic>? map) =>
      popAndReplaceWithObject(routeName, map);

  static Future<dynamic> navigateToWithObject(
    String routeName,
    Object? obj,
  ) =>
      _router.push(routeName, extra: obj);

  static Future<dynamic> popAndReplaceWithObject(
    String routeName,
    Object? obj,
  ) async {
    if (_router.canPop()) {
      _router.pop();
    }
    return await _router.push(routeName, extra: obj);
  }

  static get goBack {
    if (_router.canPop()) {
      _router.pop();
    }
  }

  static get goBeBack => _router.canPop();

  static get context => navigatorKey.currentContext;

  static void goBackCall() {
    if (_router.canPop()) {
      _router.pop();
    }
  }
}
