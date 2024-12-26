import 'package:flutter_test/flutter_test.dart';
import 'package:touch_heatmap_flutter/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HeatmapViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
