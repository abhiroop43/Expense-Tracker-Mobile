import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_custom_carousel/flutter_custom_carousel.dart';

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
          backgroundColor: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          margin: const EdgeInsets.all(8.0),
          child: Text("Card 1"),
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
