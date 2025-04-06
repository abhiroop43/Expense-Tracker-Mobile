import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:flutter_expense_tracker/common/colors.dart';
import 'package:flutter_expense_tracker/common/curved_separator.dart';

class WalletCarousel extends StatelessWidget {
  const WalletCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCarousel(
      loop: true,
      scrollSpeed: 0.5,
      effectsBuilder:
          (index, scrollRatio, child) => Transform.translate(
            offset: Offset(0, scrollRatio * 30),
            child: child,
          ),
      children: [
        Card(
          backgroundColor: ThemeColors.walletCardColor1,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: CustomPaint(
                  size: Size(double.infinity, double.infinity),
                  painter: CurvedSeparatorPainter(),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Card 1",
                    style: FluentTheme.of(
                      context,
                    ).typography.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          backgroundColor: Colors.yellow,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          margin: const EdgeInsets.all(8.0),
          child: Text("Card 2"),
        ),
        Card(
          backgroundColor: Colors.purple,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          margin: const EdgeInsets.all(8.0),
          child: Text("Card 3"),
        ),
      ],
    );
  }
}
