import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/home_widggets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            " ₹ ${catalog.price}".text.bold.xl.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).py20(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Center(
              child: Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .p16(),
            ),
            Expanded(
                child: VxArc(
                    height: 30,
                    edge: VxEdge.top,
                    arcType: VxArcType.convey,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.theme.secondaryHeaderColor)
                              .bold
                              .make(),
                          catalog.desc.text.medium
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          "Consetetur justo sit lorem sadipscing at ipsum dolor dolore dolor sadipscing. Diam diam sed ipsum amet tempor no takimata lorem, sed stet consetetur est ea no consetetur sea ut accusam. Amet lorem rebum clita justo ipsum aliquyam stet. Sanctus aliquyam dolore kasd sea, sea sea ipsum et labore. Lorem et."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16(),
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
