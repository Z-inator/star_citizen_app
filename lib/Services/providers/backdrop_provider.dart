import 'dart:developer';

import 'package:flutter/cupertino.dart';

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
    
    await controller.fling(velocity: isExpanded ? -velocity : velocity);
    
  }
}
