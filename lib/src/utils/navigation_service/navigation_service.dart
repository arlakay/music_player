import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(Widget newPage) {
    return navigatorKey.currentState.push(MaterialPageRoute(builder: (_) => newPage));
  }
}
