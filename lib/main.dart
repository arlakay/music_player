import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_telkomsel_bcg/app_config.dart';
import 'package:test_telkomsel_bcg/src/app.dart';
import 'package:test_telkomsel_bcg/src/bloc_observer.dart';
import 'package:test_telkomsel_bcg/src/utils/service_locator/setup_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  setupLocator();
  Config.appFlavor = Flavor.PRODUCTION;

  runApp(App());
}
