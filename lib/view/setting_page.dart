import 'package:ani_going/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            AuthController().signOutGoogle();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
