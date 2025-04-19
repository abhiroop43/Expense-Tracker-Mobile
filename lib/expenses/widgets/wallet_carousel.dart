import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';
import 'package:flutter_expense_tracker/expenses/widgets/carousel_card.dart';

class WalletCarousel extends StatelessWidget {
  const WalletCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var wallets = Wallets.getWallets();
    List<Widget> walletCards = [];

    for (var wallet in wallets) {
      walletCards.add(
        CarouselCard(
          totalBalance: wallet.totalBalance,
          income: wallet.income,
          expense: wallet.expense,
          walletName: wallet.walletName,
        ),
      );
    }

    return CustomCarousel(
      loop: true,
      scrollSpeed: 0.4,
      effectsBuilder:
          (index, scrollRatio, child) => Transform.translate(
            offset: Offset(0, scrollRatio * 30),
            child: child,
          ),
      children: walletCards,
    );
  }
}
