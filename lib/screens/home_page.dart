import 'package:catalogue_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue App'),
      ),
      body: const Center(
        child: Text('Hello World !!'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
