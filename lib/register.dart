import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:trashmeeu/model/baseurl.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username, password, nama;
  final _key = new GlobalKey<FormState>();

  //secure text password
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  //end

    // cek validasi

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  //end

  save() async{
    final response = await http.post(BaseUrl.register, body: {
      "username" : username,
      "password" : password,
      "nama" : nama
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];

    if (value == 1) {
      Navigator.pop(context);
    } else {
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        backgroundColor: Colors.redAccent,
      ),
      body: Form(
        key : _key,
              child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return "Tolong isi nama lengkap";
                  }
                },
                onSaved: (e) => nama = e,
                decoration: InputDecoration(
                    labelText: "Nama Lengkap", hintText: "Masukan nama lengkap")),
            TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return "Tolong isi username";
                  }
                },
                onSaved: (e) => username = e,
                decoration: InputDecoration(
                    labelText: "Username", hintText: "Masukan username")),
            TextFormField(
                validator: (e) {
                  if (e.isEmpty) {
                    return "Tolong isi password";
                  }
                },
                obscureText: _secureText,
                onSaved: (e) => password = e,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Masukan password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(
                          _secureText ? Icons.visibility_off : Icons.visibility),
                    ))),

                    RaisedButton(
                      onPressed: (){
                        check();
                      },
                      child: Text("Signup"),
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      )
          ],
        ),
      ),
    );
  }
}
