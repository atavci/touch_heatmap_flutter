import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => debugPrint('tapped!'),
      onTapDown: (TapDownDetails details) => viewModel.onTapDown(details),
      onTapUp: (TapUpDetails details) => viewModel.onTapUp(details),
      onVerticalDragStart: (details) => DragStartDetails.new,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Touch Heatmap Example'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Stack(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () => viewModel.navigateAndDisplayHeatmap(context),
                    child: const Text('Show Heatmap'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
