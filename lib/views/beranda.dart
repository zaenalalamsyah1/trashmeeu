import 'package:flutter/material.dart';

class Beranda extends StatefulWidget {
  Beranda({Key key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Text("Ini Beranda")
      ),
    );
  }
}