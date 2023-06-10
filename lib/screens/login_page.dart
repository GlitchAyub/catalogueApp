import 'package:catalogue_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBtn = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/login_pages.png',
            height: 450,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome $name',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter a username",
                      labelText: "Username",
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      hintText: "Enter a password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changeBtn = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeBtn ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(
                          changeBtn ? 50 : 10,
                        ),
                      ),
                      child: changeBtn
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   style:
                  //       TextButton.styleFrom(minimumSize: const Size(150, 40)),
                  //   child: const Text('Login'),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
