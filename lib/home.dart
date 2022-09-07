
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var dol = " US\$";
  var _resul ="_ _ _ _ ";
  
  

  void _atualizarBitcoin() async {
     final urlBitcoin = Uri.https(
      'blockchain.com', 
      '/pt/ticker');

      final Response = await http.get(urlBitcoin);
      Map<String, dynamic> retorno = json.decode(Response.body);

      setState(() {
        _resul = retorno["USD"]["buy"].toString();
        dol;
      });


      //print("Resposta: "+retorno["USD"]["buy"].toString());
      
     
      
      
      
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Price'),
        backgroundColor: Colors.orange
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 150, 20, 50),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(bottom: 15), 
                child: Image.asset("imagem/bitcoin.png"),),
             
              Padding(
                padding: EdgeInsets.only(bottom: 20), 
                child: Text(_resul+dol, 
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),)),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 15), 
                  child: TextButton(
                    onPressed: () => _atualizarBitcoin(), 
                    child: Text("Atualizar", 
                                 style: TextStyle(fontSize: 20, color: Colors.white),),
                                 style: TextButton.styleFrom(backgroundColor: Colors.orange),),)
            ],
          ),
        ),
      ),
    );
  }
}