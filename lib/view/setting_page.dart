import 'package:ani_going/controller/auth_controller.dart';
import 'package:ani_going/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthController().signOutGoogle();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
