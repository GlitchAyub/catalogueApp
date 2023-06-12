import 'dart:convert';

import 'package:catalogue_app/models/catalogue.dart';
import 'package:catalogue_app/widgets/drawer.dart';
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
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) => ItemWidget(
            //       item: CatalogModel.items[index],
            //     ),
            //   )
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                      header: Container(
                        padding: const EdgeInsets.all(10),
                        decoration:
                            const BoxDecoration(color: Colors.deepPurpleAccent),
                        child: Text(item.name,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      footer: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Text(
                          ' ₹ ${item.price.toString()}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Image.network(item.image),
                    ),
                  );
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
