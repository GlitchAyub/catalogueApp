import 'package:catalogue_app/screens/home_page.dart';
import 'package:catalogue_app/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const Homepage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/home',
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => const Homepage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
