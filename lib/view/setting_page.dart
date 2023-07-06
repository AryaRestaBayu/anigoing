import 'dart:convert';

import 'package:ani_going/controller/auth_controller.dart';
import 'package:ani_going/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
          onPressed: () async {
            AuthController().signOutGoogle();
            // var url = Uri.parse(
            //     'https://mockbin.org/bin/2cf10def-2ee2-40b4-b9f6-fc14ff0d9bd8');

            // // Menentukan header
            // Map<String, String> headers = {
            //   'Content-Type': 'application/json',
            //   'Authorization': 'Bearer your_access_token',
            // };

            // // Menentukan body
            // Map<String, dynamic> body = {
            //   'name': 'John Doe',
            //   'email': 'johndoe@example.com',
            //   'password': 'secret123',
            // };

            // // Melakukan HTTP POST request
            // var response =
            //     await http.post(url, headers: headers, body: jsonEncode(body));
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
