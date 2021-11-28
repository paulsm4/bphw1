import 'package:flutter/material.dart';
import './login_page.dart';
import './summary_page.dart';


void main() {
  runApp(const BPHWApp1());
}

class BPHWApp1 extends StatelessWidget {
  const BPHWApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/summary': (context) => SummaryPage(),
      },
      initialRoute: '/',
    );
  }
}