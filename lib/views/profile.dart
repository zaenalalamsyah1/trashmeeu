import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trashmeeu/main.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Profile> {

  String username = "", nama = "", poin = "";

  getPref() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      nama = preferences.getString("nama");
      poin = preferences.getString("poin");
    });

  }

  @override
  void initState() { 
    super.initState();
    getPref();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child : Text("Username : $username \nNama : $nama \nPoin : $poin" )
      ),
    );
  }
}