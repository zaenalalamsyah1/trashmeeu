import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:trsmee/main.dart';
// import './AddKategori.dart';


class Riwayat extends StatefulWidget {
  @override
  _RiwayatState createState() => new _RiwayatState();
}

//class RiwayatState
class _RiwayatState extends State<Riwayat> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.6/trashmee/transaksi/riwayattransaksi.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: Text("Kategori"),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.home, color: Colors.white),
      //        onPressed: () => Navigator.of(context).push(
      //          new MaterialPageRoute(builder: (BuildContext context) => new Dashboard())
      //        )
      //        )
      //   ],
      // ),
      // floatingActionButton: new FloatingActionButton(
      //   child: new Icon(Icons.add),
      //   onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
      //     builder: (BuildContext context) => new AddKategori(),
      //   )),
      // ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: new GestureDetector(
            // onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            //   builder: (BuildContext context) => new DetailKategori(
            //     list: list,
            //     index: i,
            //   ),
            // )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['kode_user']),
                leading: new Icon(Icons.check_circle),
                subtitle: new Text("Menukar dengan : ${list[i]['nama_barang']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}