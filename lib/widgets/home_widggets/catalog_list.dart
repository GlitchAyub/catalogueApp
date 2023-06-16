import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/screens/home_details.dart';
import 'package:catalogue_app/widgets/home_widggets/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(catalog: catalog),
              )),
          child: CatalogItem(
            catalog: catalog,
          ),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text
                  .color(context.theme.secondaryHeaderColor)
                  .bold
                  .make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  " ₹ ${catalog.price}".text.bold.lg.make(),
                  AddToCart(catalog: catalog)
                ],
              )
            ],
          ),
        )
      ],
    )).rounded.color(context.cardColor).square(150).make().py12();
  }
}

class AddToCart extends StatefulWidget {
  final catalog;
  const AddToCart({
    super.key,
    this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(context.theme.hintColor),
          shape: const MaterialStatePropertyAll(StadiumBorder())),
      child: isAdded ? const Icon(Icons.done) : "buy".text.make(),
    );
  }
}
