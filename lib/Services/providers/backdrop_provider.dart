import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

class BackdropProvider extends ChangeNotifier {
  BackdropProvider({required this.controller, required this.velocity});

  AnimationController controller;
  double velocity;

  bool get isExpanded {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void toggleBackdropLayerVisibility() async {
    await controller.fling(velocity: isExpanded ? -velocity : velocity);
  }
}
