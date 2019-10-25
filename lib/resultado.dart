
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gabarito_app/api.dart';

File _imagem;

class Resultado extends StatefulWidget {

  set imagem(File value) {
    _imagem = value;
  }

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  var _resultado;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Api api = new Api();
    _resultado = api.uploadFile(_imagem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Resultado", style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<dynamic>(
                  future: _resultado,
                  builder: (context, snapshot){
                    switch (snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(snapshot.data[index].title),
                                subtitle: Text(snapshot.data[index].body),
                                onTap: (){
                                  return showDialog(
                                      context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text(snapshot.data[index].title),
                                          content: Text(snapshot.data[index].body),
                                        );
                                      }
                                  );
                                },
                              );
                            }
                        );
                    }
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}
