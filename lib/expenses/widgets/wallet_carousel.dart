import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';
import 'package:flutter_expense_tracker/data/wallets.dart';
import 'package:flutter_expense_tracker/expenses/widgets/carousel_card.dart';

class WalletCarousel extends StatelessWidget {
  const WalletCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<Wallet> wallets = Wallets.getWallets();
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

    return wallets.isNotEmpty
        ? CustomCarousel(
          loop: true,
          scrollSpeed: 0.4,
          effectsBuilder:
              (index, scrollRatio, child) => Transform.translate(
                offset: Offset(0, scrollRatio * 30),
                child: child,
              ),
          children: walletCards,
        )
        : Center(
          child: Text(
            textAlign: TextAlign.center,
            'Please add a wallet to start tracking your expenses',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        );
  }
}
