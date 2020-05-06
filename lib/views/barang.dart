import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:trashmeeu/model/detailbarang.dart';


//class Barang
class Barang extends StatefulWidget {
  @override
  _BarangState createState() => new _BarangState();
}

//class BarangState
class _BarangState extends State<Barang> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.1.6/trashmee/getData.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: new AppBar(
      //   title: Text("Barang"),
      //           actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.category, color: Colors.white),
      //        onPressed: () => Navigator.of(context).push(
      //          new MaterialPageRoute(builder: (BuildContext context) => new Dashboard())
      //        )
      //        )
      //   ],
      // ),
      // floatingActionButton: new FloatingActionButton(
      //   child: new Icon(Icons.add),
      //   onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
      //     builder: (BuildContext context) => new AddData(),
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
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new DetailBarang(
                list: list,
                index: i,
              ),
            )),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama_barang']),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Poin : ${list[i]['nilai_poin']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}