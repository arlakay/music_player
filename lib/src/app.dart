import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_telkomsel_bcg/src/blocs/music/music_bloc.dart';
import 'package:test_telkomsel_bcg/src/pages/launch/launch_page.dart';
import 'package:test_telkomsel_bcg/src/utils/navigation_service/navigation_service.dart';
import 'package:test_telkomsel_bcg/src/utils/network/network_manager.dart';
import 'package:test_telkomsel_bcg/src/utils/router/router_service.dart';
import 'package:test_telkomsel_bcg/src/utils/service_locator/setup_locator.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MusicBloc>(
          create: (BuildContext context) => MusicBloc(networkManager: NetworkManager()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterService.generateRoute,
        navigatorKey: locator<NavigationService>().navigationKey,
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color(0xFF007AFF),
            surface: Colors.white,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LaunchPage(),
      ),
    );
  }
}
