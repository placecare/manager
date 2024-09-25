import 'package:manager/router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(ShadcnApp.router(
    title: 'Placecare Manager',
    routerConfig: router,
    theme: ThemeData(
      colorScheme: ColorSchemes.lightZinc(),
      radius: 0.5,
    ),
  ),);
}