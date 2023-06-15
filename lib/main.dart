import 'package:catalogue_app/screens/cart.dart';
import 'package:catalogue_app/screens/home_page.dart';
import 'package:catalogue_app/screens/login_page.dart';
import 'package:catalogue_app/utils/routes.dart';
import 'package:catalogue_app/widgets/theme_data.dart';
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
      theme: MyThemeData.lightTheme(context),
      darkTheme: MyThemeData.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const Homepage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartPageRoute: (context) => const CartPage(),
      },
    );
  }
}
