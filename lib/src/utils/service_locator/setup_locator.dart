import 'package:get_it/get_it.dart';
import 'package:test_telkomsel_bcg/src/utils/navigation_service/navigation_service.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
