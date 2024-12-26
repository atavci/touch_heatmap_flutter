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
      alignment: Alignment.bottomLeft,
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
          child: Text('Touch Heatmap'),
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

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    /// Base radius for the circles
    const double baseRadius = 5.0;

    /// Neighbour distance for a position to calculate density.
    const double neighbourDistance = 20.0;

    /// Map to store the density of each point
    Map<Offset, int> densityMap = {};

    // Calculate density
    for (var position in touchPositions) {
      int density = 0;
      for (var otherPosition in touchPositions) {
        // Consider a fixed radius to check for nearby points
        if ((position - otherPosition).distance < neighbourDistance) {
          density++;
        }
      }
      densityMap[position] = density;
    }

    // Draw each point with a radius based on its density
    densityMap.forEach((position, density) {
      // Normalize density to determine the radius
      // The more dense, the larger the circle
      double radius = baseRadius + (density * 1.5); // Increase radius based on density

      // Set color based on density (optional)
      paint.color = Color.lerp(Colors.lightBlue, Colors.red,
          density / densityMap.values.fold(0, (prev, element) => element > prev ? element : prev))!;

      canvas.drawCircle(position, radius, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
