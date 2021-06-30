import 'package:flutter/material.dart';

import '../constants.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key, required this.onTap, required this.child})
      : super(key: key);

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              height: 24.0,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}

class BackdropTitle extends AnimatedWidget {
  const BackdropTitle(
      {Key? key,
      required this.onPress,
      required this.frontTitle,
      required this.backTitle,
      required Animation<double> listenable})
      : listenable = listenable,
        super(key: key, listenable: listenable);

  final void Function() onPress;
  final Widget frontTitle;
  final Widget backTitle;
  final Animation<double> listenable;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Row(

      children: [        
        SizedBox(
          width: 72.0,
          child: IconButton(
            padding: EdgeInsets.only(right: 8),
            onPressed: this.onPress,
            icon: Stack(
              children: [
                Opacity(
                  opacity: CurvedAnimation(
                          parent: ReverseAnimation(animation),
                          curve: Interval(0.5, 1.0))
                      .value,
                  child: Icon(Icons.build_rounded),
                ),
                Opacity(
                  opacity: CurvedAnimation(
                          parent: animation,
                          curve: Interval(0.5, 1.0))
                      .value,
                  child: Icon(Icons.tune_rounded),
                ),
              ],
            ),
          ),
        ),
        Stack(
          children: [
            Opacity(
              opacity: CurvedAnimation(
                      parent: ReverseAnimation(animation),
                      curve: Interval(0.5, 1.0))
                  .value,
              child: backTitle,
            ),
            Opacity(
              opacity: CurvedAnimation(
                      parent: animation,
                      curve: Interval(0.5, 1.0))
                  .value,
              child: frontTitle,
            ),
          ],
        ),
      ],
    );
  }
}

class Backdrop extends StatefulWidget {
  Backdrop(
      {Key? key,
      required this.frontLayer,
      required this.backLayer,
      required this.frontTitle,
      required this.backTitle})
      : super(key: key);

  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  @override
  _BackdropState createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey backdropKey = GlobalKey(debugLabel: 'Backdrop');
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: Duration(milliseconds: 300), value: 1.0, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool get frontLayerVisible {
    final AnimationStatus status = controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void toggleBackdropLayerVisibility() {
    controller.fling(
        velocity: frontLayerVisible ? -kFlingVelocity : kFlingVelocity);
  }

  Widget buildStack(BuildContext context, BoxConstraints constraints) {
    double layerTileHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTileHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(
                0.0, layerTop, 0.0, layerTop - layerSize.height),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(controller.view);

    return Stack(
      key: backdropKey,
      children: <Widget>[
        widget.backLayer,
        PositionedTransition(
          rect: layerAnimation,
          child: FrontLayer(
            onTap: toggleBackdropLayerVisibility,
            child: widget.frontLayer,
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: BackdropTitle(
        listenable: controller.view,
        onPress: toggleBackdropLayerVisibility,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu_rounded,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        body: LayoutBuilder(
          builder: buildStack,
        ),
      ),
    );
  }
}
