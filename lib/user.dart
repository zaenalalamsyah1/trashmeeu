import 'package:flutter/material.dart';
import 'package:trashmeeu/views/beranda.dart';
import 'package:trashmeeu/views/barang.dart';
import 'package:trashmeeu/views/profile.dart';
import 'package:trashmeeu/views/riwayat.dart';


class User extends StatefulWidget {
// membuat logout
  final VoidCallback logOut;
  User(this.logOut);

//end

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  logOut() {
    setState(() {
      widget.logOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
          child: Scaffold(
        appBar: AppBar(
          title: Text("User"),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                logOut();
              },
              icon: Icon(Icons.exit_to_app),
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Beranda(),
            Barang(),
            Riwayat(),
            Profile()
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              text: "Beranda"
            ),
            Tab(
              icon: Icon(Icons.apps),
              text: "Barang"
            ),
            Tab(
              icon: Icon(Icons.history),
              text: "Riwayat"
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "Profil"
            ),
          ],
        ),
      ),
    );
  }
}
