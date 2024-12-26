import 'package:flutter/src/gestures/tap.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:touch_heatmap_flutter/app/app.bottomsheets.dart';
import 'package:touch_heatmap_flutter/app/app.dialogs.dart';
import 'package:touch_heatmap_flutter/app/app.locator.dart';
import 'package:touch_heatmap_flutter/app/app.router.dart';
import 'package:touch_heatmap_flutter/app/locator_helper.dart';
import 'package:touch_heatmap_flutter/ui/common/app_strings.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final touchPositions = <Offset>[];

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

  onTapDown(TapDownDetails details) {
    touchPositions.add(details.globalPosition);
    notifyListeners();
    debugPrint("tap down ${details.globalPosition}");
  }

  onTapUp(TapUpDetails details) {
    touchPositions.add(details.globalPosition);
    notifyListeners();
    debugPrint("tap up ${details.globalPosition}");
  }

  navigateAndDisplayHeatmap(BuildContext context) {
    navigator.navigateToHeatmapView(
      touchPositions: touchPositions,
    );
  }
}
