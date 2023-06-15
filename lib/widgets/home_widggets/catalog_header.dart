import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue App"
            .text
            .xl5
            .color(context.theme.secondaryHeaderColor)
            .make(),
        "Trending Products".text.make()
      ],
    );
  }
}
