import 'package:flutter/material.dart';
import 'package:star_citizen_app/contants.dart';

class FilterBackdrop extends StatefulWidget {
  final Widget frontLayer;
  final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;
  var currentCategory;
  FilterBackdrop(
      {Key? key,
      required this.frontLayer,
      required this.backLayer,
      required this.frontTitle,
      required this.backTitle})
      : super(key: key);

  @override
  _FilterBackdropState createState() => _FilterBackdropState();
}

class _FilterBackdropState extends State<FilterBackdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 300), value: 1.0, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FilterBackdrop old) {
    super.didUpdateWidget(old);
    if (widget.currentCategory != old.currentCategory) {
      _toggleBackdropLayerVisibility();
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: kFlingVelocity);
    }
  }

  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -kFlingVelocity : kFlingVelocity);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
            child: widget.backLayer, excluding: _frontLayerVisible),
        PositionedTransition(
            rect: layerAnimation, child: FrontLayer(child: widget.frontLayer))
      ],
    );
  }

  var appBar = AppBar(
    brightness: Brightness.light,
    elevation: 0.0,
    titleSpacing: 0.0,
    // TODO: Replace leading menu icon with IconButton (104)
    // TODO: Remove leading property (104)
    // TODO: Create title with _BackdropTitle parameter (104)
    leading: IconButton(
        icon: Icon(Icons.menu), onPressed: _toggleBackdropLayerVisibility),
    title: Text('SHRINE'),
    actions: <Widget>[
      // TODO: Add shortcut to login screen from trailing icons (104)
      IconButton(
        icon: Icon(
          Icons.search,
          semanticLabel: 'search',
        ),
        onPressed: () {
          // TODO: Add open login (104)
        },
      ),
      IconButton(
        icon: Icon(
          Icons.tune,
          semanticLabel: 'filter',
        ),
        onPressed: () {
          // TODO: Add open login (104)
        },
      ),
    ],
    backwardsCompatibility: false,
  );

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      // TODO: Replace leading menu icon with IconButton (104)
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      leading: IconButton(
          icon: Icon(Icons.menu), onPressed: _toggleBackdropLayerVisibility),
      title: Text('SHRINE'),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
      ],
      backwardsCompatibility: false,
    );
    return Scaffold(
      appBar: appBar,
      body: LayoutBuilder(builder: _buildStack),
    );
  }
}

class FrontLayer extends StatelessWidget {
  const FrontLayer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [Expanded(child: child)],
      ),
    );
  }
}
