import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Catalogue App')),),
      body: const Center(
        child: Text('Hello from the Darkness Side'),
      ),
      drawer: const Drawer(
        
      ),
    );
  }
}
