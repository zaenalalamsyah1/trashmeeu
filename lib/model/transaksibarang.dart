import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TransaksiBarang extends StatefulWidget {

  
  TransaksiBarang({Key key}) : super(key: key);

  @override
  _TransaksiBarangState createState() => _TransaksiBarangState();
}

class _TransaksiBarangState extends State<TransaksiBarang> {
  TextEditingController controllerNamaBarang = new TextEditingController();
  TextEditingController controllerJumlah = new TextEditingController();
  TextEditingController controllerPoinTerpakai = new TextEditingController();
  TextEditingController controllerKodeUser = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();

  void TransaksiBarang(){
    var url ="http://192.168.1.6/trashmee/transaksi/transaksipoin.php";
    http.post(url, body:{

      "nama_barang": controllerNamaBarang.text, 
      "jumlah" : controllerJumlah.text,
      "poin_terpakai" : controllerPoinTerpakai.text,
      "kode_user" : controllerKodeUser.text,
      "alamat" : controllerAlamat.text,

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("TUKAR POIN"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              new TextField(
                controller: controllerNamaBarang,
                decoration: new InputDecoration(
                  hintText: "Nama Barang",
                  labelText: "Nama Barang",
                ),
              ),
              new TextField(
                controller: controllerJumlah,
                decoration: new InputDecoration(
                  hintText: "Jumlah penukaran",
                  labelText: "Jumlah Penukaran (qty)",
                ),
              ),
              new TextField(
                controller: controllerPoinTerpakai,
                decoration: new InputDecoration(
                  hintText: "Masukan Poin",
                  labelText: "Masukan Poin",
                ),
              ),
                            new TextField(
                controller: controllerKodeUser,
                decoration: new InputDecoration(
                  hintText: "Masukan username penerima",
                  labelText: "Kode User",
                ),
              ),
                                          new TextField(
                controller: controllerAlamat,
                decoration: new InputDecoration(
                  hintText: "Masukan Alamat Penerima",
                  labelText: "Alamat",
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
              ),
              new RaisedButton(
                child: new Text("TUKAR"),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  TransaksiBarang();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
