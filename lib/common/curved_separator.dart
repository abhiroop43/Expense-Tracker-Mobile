import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_expense_tracker/common/colors.dart';

class CurvedSeparatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw the top background
    paint.color = ThemeColors.walletCardColor1;
    final topPath =
        Path()
          ..lineTo(0, size.height)
          ..quadraticBezierTo(size.width, size.height, size.width, size.height)
          ..lineTo(size.width, 0.5)
          ..close();
    canvas.drawPath(topPath, paint);

    // Draw the bottom background
    paint.color = ThemeColors.walletCardColor2;
    final bottomPath =
        Path()
          ..moveTo(0, size.height * 0.2)
          ..quadraticBezierTo(
            size.width * 0.5,
            size.height * 0.25,
            size.width * 1.1,
            size.height,
          )
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
    canvas.drawPath(bottomPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
