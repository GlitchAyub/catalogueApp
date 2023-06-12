import 'dart:convert';

import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/drawer.dart';
import 'package:catalogue_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogueJson =
        await rootBundle.loadString('assets/files/catalogue.json');
    var decodedData = jsonDecode(catalogueJson);
    var productsData = decodedData["product"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    // List<Item> list = List.from(productsData)
    // .map<Item>((item) => Item.fromMap(item))
    // .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Catalogue App',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) => ItemWidget(
                  item: CatalogModel.items[index],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
