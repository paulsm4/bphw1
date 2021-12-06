// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import '/services/boxpik_service.dart';
import '/screens/summary_page.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();
    
  @override
  Widget build(BuildContext context) {
    BoxPikService boxpikService = BoxPikService();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign in to BoxPik!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: SizedBox(
                    width: 276,
                    height: 244,
                    child: Image.asset('assets/images/boxpik_splash_image.png'),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0, top: 5, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 10),
              //padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _pwdController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  boxpikService
                  .login(_emailController.text, _pwdController.text)
                  .then((isLoggedOn) {
                    if (isLoggedOn) {
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => SummaryPage())
                      );
                    } else {
                      _LoginErrorAlert().show(context, boxpikService.lastError);
                    }
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginErrorAlert {
  void show(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login error"),
          content: Text(msg),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop()
            ),
          ]
        );
    });
  }
}