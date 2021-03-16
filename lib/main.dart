import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
void main() => runApp(MiApp());

//Primer widget inmutable

class MiApp extends StatelessWidget{
  const MiApp({Key key}) : super( key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget{
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future<String> sendData() async{ //New Function to send emails
    
    var data = jsonEncode(<String, String>{
        "Email": "marcodevlg@gmail.com",
        "Name": "Marco Lopez",
        "Datetime": DateTime.now().toIso8601String(),
        "Step": 
    });

    var response = await http.post(
      Uri.https('', '/api/data'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: data
    );
    print(response.body);
    return "Success!!";
  }

  var _random;

  void random(){
    _random = new Random();
  for (var i = 0; i < 10; i++) {
    print(_random.nextInt(1001));
  }


  }

  void verifica(){

    if(_random % 2 ==0 ){
      sendData1();
    }
    else if(_random % 2 ==1){
      sendData2();
    }
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App Dark"),       
      ),
      body: Center(
        child: new ElevatedButton(
          onPressed: sendData, 
          child: new Text("Generar numero random")
          ),
     ),
    );
  }
}