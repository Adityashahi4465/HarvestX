import 'package:flutter/material.dart';
import '../../../core/common/singInButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "HarvestX",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              ),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "'Track Save Grow'",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
