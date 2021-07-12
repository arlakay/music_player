

import 'package:flutter/material.dart';
import 'package:test_telkomsel_bcg/src/pages/launch/launch_page.dart';
import 'package:test_telkomsel_bcg/src/pages/music/music_page.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationName.launch:
        return MaterialPageRoute(
          builder: (_) => LaunchPage(
            key: Key('launch'),
          ),
        );
      case NavigationName.music:
        return MaterialPageRoute(
          builder: (_) => MusicPage(
            key: Key('music'),
          ),
        );
      // case NavigationName.userSelection:
      //   final IGUser args = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => UserSelectionPage(
      //       igUser: args,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

class NavigationName {
  static const String music = '/music';
  static const String launch = '/launch';
}
