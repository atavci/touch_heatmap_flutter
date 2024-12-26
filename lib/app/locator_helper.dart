import 'package:stacked_services/stacked_services.dart';
import 'package:touch_heatmap_flutter/app/app.locator.dart';

NavigationService get navigator {
  // assert(locator.isRegistered(instance: NavigationService));
  return locator<NavigationService>();
}
