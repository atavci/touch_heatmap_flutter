import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:touch_heatmap_flutter/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:touch_heatmap_flutter/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:touch_heatmap_flutter/ui/views/heatmap/heatmap_view.dart';
import 'package:touch_heatmap_flutter/ui/views/home/home_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: HeatmapView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
