import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'heatmap_viewmodel.dart';

class HeatmapView extends StackedView<HeatmapViewModel> {
  final List<Offset> touchPositions;

  const HeatmapView({
    Key? key,
    required this.touchPositions,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HeatmapViewModel viewModel,
    Widget? child,
  ) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomPaint(
            size: Size.infinite,
            painter: HeatmapPainter(touchPositions),
          ),
        ),
        const SafeArea(
            child: Material(
                child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Heatmap'),
        ))),
      ],
    );
  }

  @override
  HeatmapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HeatmapViewModel();
}

class HeatmapPainter extends CustomPainter {
  final List<Offset> touchPositions;
  HeatmapPainter(this.touchPositions);

  /// Merge points that are within [threshold] distance into clusters.
  List<List<Offset>> _clusterPoints(List<Offset> points, double threshold) {
    final visited = <Offset>{};
    final clusters = <List<Offset>>[];

    for (final p in points) {
      if (!visited.contains(p)) {
        final queue = <Offset>[p];
        final cluster = <Offset>[];

        while (queue.isNotEmpty) {
          final current = queue.removeLast();
          if (visited.add(current)) {
            cluster.add(current);
            for (final candidate in points) {
              if (!visited.contains(candidate) &&
                  (candidate - current).distance < threshold) {
                queue.add(candidate);
              }
            }
          }
        }
        clusters.add(cluster);
      }
    }
    return clusters;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const double mergeThreshold = 50.0;
    final clusters = _clusterPoints(touchPositions, mergeThreshold);

    final maxSize = clusters.isEmpty
        ? 1
        : clusters.map((c) => c.length).reduce((a, b) => a > b ? a : b);

    for (final cluster in clusters) {
      if (cluster.isEmpty) continue;

      final avgX = cluster.map((p) => p.dx).reduce((a, b) => a + b) / cluster.length;
      final avgY = cluster.map((p) => p.dy).reduce((a, b) => a + b) / cluster.length;
      final center = Offset(avgX, avgY);

      final ratio = (cluster.length / maxSize).clamp(0.0, 1.0);

      Color clusterColor;
      if (ratio < 0.5) {
        final r = ratio * 2;
        clusterColor = Color.lerp(Colors.green, Colors.yellow, r)!;
      } else {
        final r = (ratio - 0.5) * 2;
        clusterColor = Color.lerp(Colors.yellow, Colors.red, r)!;
      }

      final radius = 10.0 + (cluster.length * 2.0 * ratio);

      final gradientPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            clusterColor.withOpacity(0.6),
            Colors.teal.withOpacity(.2),
          ],
          stops: const [0.3, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: radius));

      canvas.drawCircle(center, radius, gradientPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
