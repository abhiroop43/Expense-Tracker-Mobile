import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:flutter_expense_tracker/expenses/widgets/carousel_card.dart';

class WalletCarousel extends StatelessWidget {
  const WalletCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCarousel(
      loop: true,
      scrollSpeed: 0.4,
      effectsBuilder:
          (index, scrollRatio, child) => Transform.translate(
            offset: Offset(0, scrollRatio * 30),
            child: child,
          ),
      children: [
        CarouselCard(
          totalBalance: 484.00,
          income: 2379.00,
          expense: 1895.00,
          walletName: "Personal",
        ),
        CarouselCard(
          totalBalance: 1250.75,
          income: 3450.50,
          expense: 2199.75,
          walletName: "Savings",
        ),
        CarouselCard(
          totalBalance: 682.30,
          income: 1850.00,
          expense: 1167.70,
          walletName: "Travel",
        ),
        CarouselCard(
          totalBalance: 325.18,
          income: 1578.45,
          expense: 1253.27,
          walletName: "Business",
        ),
        CarouselCard(
          totalBalance: 2105.60,
          income: 4500.00,
          expense: 2394.40,
          walletName: "Investment",
        ),
        CarouselCard(
          totalBalance: 563.92,
          income: 1985.50,
          expense: 1421.58,
          walletName: "Emergency",
        ),
      ],
    );
  }
}
