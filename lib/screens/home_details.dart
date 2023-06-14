import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.creamColor,
      ),
      backgroundColor: MyThemeData.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            " ₹ ${catalog.price}".text.bold.xl.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(MyThemeData.darkBlueColor),
                  shape: const MaterialStatePropertyAll(StadiumBorder())),
              child: "Buy".text.make(),
            ).wh(100, 50)
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
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyThemeData.darkBlueColor)
                              .bold
                              .make(),
                          catalog.desc.text.medium
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                        ],
                      ).py64(),
                    )))
          ],
        ),
      ),
    );
  }
}
