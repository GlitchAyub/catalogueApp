import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/login_pages.png',
            height: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter a username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: const InputDecoration(
                    hintText: "Enter a password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print('sheesh');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
