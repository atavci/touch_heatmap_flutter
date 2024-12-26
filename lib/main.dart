import 'package:flutter/material.dart';
import 'package:touch_heatmap_flutter/app/app.bottomsheets.dart';
import 'package:touch_heatmap_flutter/app/app.dialogs.dart';
import 'package:touch_heatmap_flutter/app/app.locator.dart';
import 'package:touch_heatmap_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.homeView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
