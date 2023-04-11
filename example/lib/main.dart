import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:native_auth/native_auth.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueAuth = "No initialized";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Auth")),
      bottomNavigationBar: buttonAuth(),
      body: Center(child: Text(valueAuth)),
    );
  }

  Widget buttonAuth() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(onPressed: auth, child: const Text("Auth me")),
      ),
    );
  }

  Future<void> auth() async {
    final response = await Auth.isAuthenticate();
    log('is authenticated: ${response.isAuthenticated}');
    setState(() {
      valueAuth = response.toString();
    });
  }
}
