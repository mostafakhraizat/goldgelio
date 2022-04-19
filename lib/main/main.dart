import 'package:flutter/material.dart';
import 'package:goldgelio/register/reg_select_role.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Steve app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegSelectRole(),
    );
  }
}
