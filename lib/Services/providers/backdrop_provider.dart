import 'dart:developer';

import 'package:flutter/material.dart';

class BackdropProvider extends ChangeNotifier {
  BackdropProvider({required this.controller, required this.velocity});

  AnimationController controller;
  double velocity;
  // AnimationStatus status;

  bool get isExpanded {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  // AnimationStatus get status {

  // }

  void toggleBackdropLayerVisibility() async {
    isExpanded ? controller.reverse() : controller.forward();
    // await controller.fling(velocity: isExpanded ? -velocity : velocity);
  }
}
