import 'package:flutter/material.dart';
import 'package:native_auth/native_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueAuth = "No inialized";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auth")),
      bottomNavigationBar: this.buttonAuth(),
      body: Center(child: Text(valueAuth)),
    );
  }

  Widget buttonAuth() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          child: Text("Auth me"),
          onPressed: this.auth
        ),
      ),
    );
  }

  Future<void> auth() async {
    final response = await Auth.isAuthenticate();
    setState(() {
      this.valueAuth = response.toString();
    });
  }
}
