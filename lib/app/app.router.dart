// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i5;

import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:touch_heatmap_flutter/ui/views/heatmap/heatmap_view.dart' as _i3;
import 'package:touch_heatmap_flutter/ui/views/home/home_view.dart' as _i2;

class Routes {
  static const homeView = '/home-view';

  static const heatmapView = '/heatmap-view';

  static const all = <String>{
    homeView,
    heatmapView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.heatmapView,
      page: _i3.HeatmapView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.HeatmapView: (data) {
      final args = data.getArgs<HeatmapViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.HeatmapView(key: args.key, touchPositions: args.touchPositions),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class HeatmapViewArguments {
  const HeatmapViewArguments({
    this.key,
    required this.touchPositions,
  });

  final _i4.Key? key;

  final List<_i5.Offset> touchPositions;

  @override
  String toString() {
    return '{"key": "$key", "touchPositions": "$touchPositions"}';
  }

  @override
  bool operator ==(covariant HeatmapViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.touchPositions == touchPositions;
  }

  @override
  int get hashCode {
    return key.hashCode ^ touchPositions.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> navigateToHeatmapView({
    _i4.Key? key,
    required List<_i5.Offset> touchPositions,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return navigateTo<dynamic>(Routes.heatmapView,
        arguments: HeatmapViewArguments(key: key, touchPositions: touchPositions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<dynamic> replaceWithHeatmapView({
    _i4.Key? key,
    required List<_i5.Offset> touchPositions,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  }) async {
    return replaceWith<dynamic>(Routes.heatmapView,
        arguments: HeatmapViewArguments(key: key, touchPositions: touchPositions),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
