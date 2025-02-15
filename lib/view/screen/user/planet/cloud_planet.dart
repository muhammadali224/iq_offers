import 'dart:math';

import 'package:flutter/material.dart';

import 'models.dart';

class CloudPlanet extends StatefulWidget {
  final List<PlanetItem> items;
  final double minRadius;
  final Duration velocity;

  const CloudPlanet({
    super.key,
    required this.items,
    this.minRadius = 50,
    this.velocity = const Duration(
      seconds: 150,
    ),
  });

  @override
  State<CloudPlanet> createState() => _CloudPlanetState();
}

class _CloudPlanetState extends State<CloudPlanet>
    with SingleTickerProviderStateMixin {
  late final AnimationController velocityController;
  late final PlanetController controller;

  Offset _velocityPerSecond = Offset.zero;

  @override
  void initState() {
    super.initState();

    controller = PlanetController(items: widget.items);
    velocityController = AnimationController(
      vsync: this,
      duration: widget.velocity,
    );
    _startAutoRotation();
  }

  @override
  void dispose() {
    controller.dispose();
    velocityController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final radius = min(constraints.maxWidth, constraints.maxHeight) / 2;

      if (radius < widget.minRadius) {
        return const SizedBox.shrink();
      }

      controller.setRadius(radius);

      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanUpdate: (details) {
          final delta = details.delta;
          controller.updateCoordinateForItems(delta);
        },
        onPanEnd: _onPanEnd,
        child: SizedBox.square(
          dimension: controller.effectiveRadius * 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              for (final item in controller.items) item.widget,
            ],
          ),
        ),
      );
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _velocityPerSecond = details.velocity.pixelsPerSecond / 1000;

    velocityController.reset();

    velocityController.addListener(_decreasingVelocityByTick);

    velocityController.forward().then(
          (_) => velocityController.removeListener(_decreasingVelocityByTick),
        );
  }

  void _decreasingVelocityByTick() {
    final delta =
        Offset.lerp(_velocityPerSecond, Offset.zero, velocityController.value);
    controller.updateCoordinateForItems(delta!);
  }

  void _startAutoRotation() {
    // velocityController = AnimationController(
    //   vsync: this,
    //   duration: widget.velocity,
    // );
    // velocityController.duration = const Duration(seconds: 150);
    velocityController.repeat();
  }
}
