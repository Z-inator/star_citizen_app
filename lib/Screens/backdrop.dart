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
              height: 46.0,
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

class BackdropTitle extends StatelessWidget {
  const BackdropTitle(
      {Key? key,
      required this.onPress,
      required this.frontTitle,
      required this.backTitle,
      required this.listenable})
      : super(key: key);

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
            padding: EdgeInsets.only(left: 8),
            onPressed: this.onPress,
            icon: Stack(
              children: [
                Opacity(
                  opacity: CurvedAnimation(
                          parent: ReverseAnimation(animation),
                          curve: Interval(0.5, 1.0))
                      .value,
                  child: FractionalTranslation(
                      translation: Tween<Offset>(
                              begin: Offset.zero, end: Offset(0.5, 0.0))
                          .evaluate(animation),
                      child: Icon(Icons.tune_rounded)),
                ),
                Opacity(
                  opacity: CurvedAnimation(
                          parent: ReverseAnimation(animation),
                          curve: Interval(0.5, 1.0))
                      .value,
                  child: FractionalTranslation(
                      translation: Tween<Offset>(
                              begin: Offset.zero, end: Offset(-0.25, 0.0))
                          .evaluate(animation),
                      child: Icon(Icons.build_rounded)),
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
              child: FractionalTranslation(
                  translation:
                      Tween<Offset>(begin: Offset.zero, end: Offset(0.5, 0.0))
                          .evaluate(animation),
                  child: backTitle),
            ),
            Opacity(
              opacity: CurvedAnimation(
                      parent: ReverseAnimation(animation),
                      curve: Interval(0.5, 1.0))
                  .value,
              child: FractionalTranslation(
                  translation:
                      Tween<Offset>(begin: Offset.zero, end: Offset(-0.25, 0.0))
                          .evaluate(animation),
                  child: frontTitle),
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
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
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

class StatsDashboard extends StatelessWidget {
  const StatsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        reverse: true,
        children: [
          ListTile(
            title: Text('Build Name'),
          ),
          ListTile(
            title: Text('Weapons'),
          ),
          ListTile(
            title: Text('Turrets'),
          ),
          ListTile(
            title: Text('Missiles'),
          ),
          ListTile(
            title: Text('EMPS'),
          ),
          ListTile(
            title: Text('Shields'),
          ),
          ListTile(
            title: Text('Power'),
          ),
          ListTile(
            title: Text('Cooling'),
          ),
          ListTile(
            title: Text('EM/IR'),
          ),
        ],
      ),
    );
  }
}

class ComponentSelection extends StatelessWidget {
  const ComponentSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            title: Text('Build Name'),
          ),
          ListTile(
            title: Text('Weapons'),
          ),
          ListTile(
            title: Text('Turrets'),
          ),
          ListTile(
            title: Text('Missiles'),
          ),
          ListTile(
            title: Text('EMPS'),
          ),
          ListTile(
            title: Text('Shields'),
          ),
          ListTile(
            title: Text('Power'),
          ),
          ListTile(
            title: Text('Cooling'),
          ),
          ListTile(
            title: Text('EM/IR'),
          ),
        ],
      ),
    );
  }
}