import 'package:flutter/material.dart';

// Animation Constants
const double kFlingVelocity = 2.0;

// Color Constants
const Color kPrimaryNavy = Color(0xFF0C2838);
const Color kPrimaryNavyVariant = Color(0xFF09314D);
const Color kOnPrimaryNavy = Color(0xFFD6D6D6);
const Color kSecondaryCyan = Color(0xFF42EDF8);
const Color kSecondaryCyanVariant = Color(0xFF02F0DB);
const Color kOnSecondaryCyan = Color(0xFF0C2838);
Color kSurface = Colors.grey.shade800;
Color kGreyOnSurface = Colors.grey.shade600;

// Shape Constants
const double kSmallBevel = 4.0;
const double kSmallBevelWidth = 1.0;
const double kMediumBevel = 8.0;
const double kMediumBevelWidth = 2.0;
const double kLargeBevel = 24.0;
const double kLargeBevelWidth = 4.0;

BeveledRectangleBorder buildBeveledRectangleBorder(
    Color color, double size, double width) {
  return BeveledRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(size)),
      side: BorderSide(color: color, width: width));
}

class BeveledRectanglePainter extends CustomPainter {
  BeveledRectanglePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint()..color = color;
    canvas.drawRect(shapeBounds, paint);
  }

  @override
  bool shouldRepaint(BeveledRectanglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BeveledRectanglePainter oldDelegate) => false;
}
