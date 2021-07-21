import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_citizen_app/Screens/mobile_screen.dart';
import 'package:star_citizen_app/Services/providers/backdrop_provider.dart';
import 'package:star_citizen_app/main.dart';

import '../constants.dart';

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0)),
      ),
      child: child,
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
  final String frontTitle;
  final String backTitle;
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
                          parent: animation, curve: Interval(0.5, 1.0))
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
              child: Text(backTitle,
                  style: Theme.of(context).primaryTextTheme.headline6),
            ),
            Opacity(
              opacity:
                  CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0))
                      .value,
              child: Text(frontTitle,
                  style: Theme.of(context).primaryTextTheme.headline6),
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
  final String frontTitle;
  final String backTitle;

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

  // void toggleBackdropLayerVisibility() async {
  //   await controller.fling(
  //       velocity: isExpanded.value ? -kFlingVelocity : kFlingVelocity);
  //   isExpanded.value = !isExpanded.value;
  // }

  Widget buildStack(BuildContext context, BoxConstraints constraints) {
    double layerTileHeight = 45.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTileHeight;
    print(layerTop.toString());
    print(layerSize.height.toString());

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
            begin: RelativeRect.fromLTRB(layerSize.width * 0.75, layerTop, 0.0,
                layerTop - layerSize.height),
            end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(controller.view);

    // AnimationController animation = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 300), value: 1.0);

    double testHeight = layerTop / layerSize.height;

    Animation<Offset> slideAnimation =
        Tween<Offset>(begin: Offset(0.75, testHeight), end: Offset(0, 0))
            .animate(controller.view);

    return Stack(
      key: backdropKey,
      children: <Widget>[
        widget.backLayer,
        // AnimatedBuilder(
        //   animation: animation,
        //   builder: (context, child) {
        //     return Container(
        //       height: animation.value * (),
        //     )
        //   }
        // ),
        SlideTransition(
          position: slideAnimation,
          child: FrontLayer(child: widget.frontLayer),
        ),
        // PositionedTransition(
        //   rect: layerAnimation,
        //   child: FrontLayer(
        //     child: widget.frontLayer,
        //   ),
        // ),
      ],
    );
  }

  PreferredSizeWidget buildCalculatorAppBar(BuildContext context) {
    BackdropProvider backDropProvider =
        Provider.of<BackdropProvider>(context, listen: false);
    return AppBar(
      title: BackdropTitle(
        listenable: controller.view,
        onPress: backDropProvider.toggleBackdropLayerVisibility,
        frontTitle: widget.frontTitle,
        backTitle: widget.backTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) =>
            BackdropProvider(controller: controller, velocity: kFlingVelocity),
        builder: (context, child) {
          BackdropProvider backDropProvider =
              Provider.of<BackdropProvider>(context, listen: false);
          return MobileFrameWork(
            title: BackdropTitle(
                listenable: controller.view,
                onPress: backDropProvider.toggleBackdropLayerVisibility,
                frontTitle: widget.frontTitle,
                backTitle: widget.backTitle,
              ),
            // buildCalculatorAppBar(context),
            body: LayoutBuilder(builder: buildStack),
          );
          // Container(
          //   color: Theme.of(context).colorScheme.background,
          //   child: SafeArea(
          //     child: Scaffold(
          //       backgroundColor: Theme.of(context).colorScheme.background,
          //       appBar: buildCalculatorAppBar(context),
          //       body: LayoutBuilder(
          //         builder: buildStack,
          //       ),
          //       endDrawer: buildDrawer(context),
          //     ),
          //   ),
          // );
        });
  }
}
