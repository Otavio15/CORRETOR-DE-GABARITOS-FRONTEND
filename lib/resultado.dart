
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gabarito_app/api.dart';
import 'package:gabarito_app/questoes.dart';
import 'package:path_provider/path_provider.dart';

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

  List<Questao> _resultadoAluno = [];

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/dados.json" );
  }

  _lerArquivo() async {
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  Map<String, dynamic> gabarito;
  List<Questao> _questoes = [];

  _getResultado(snapshot) async{
    Map<String, dynamic> dados = json.decode(snapshot);
    for (var dado in dados.keys){
      Questao q = new Questao();
      q.index = int.parse(dado);
      q.resposta = dados[dado];
      _resultadoAluno.add(q);
    }
    _ordenarLista(_resultadoAluno);
  }

  _ordenarLista(List<Questao> lista){
    List <Questao> listAux = [];
    for (var i = 0; i < lista.length; i++){
      Questao q = new Questao();
      for (var dado in lista){
        if (i == dado.index){
          q.index = i;
          q.resposta = lista[i].resposta;
          print("key ${q.index}, value ${q.resposta}");
          listAux.add(q);
        }
      }
    }
  }

  _Icones(valor1, valor2){
    if (valor1 == valor2){
      return Icon(Icons.done, color: Colors.green,);
    }
    else{
      return Icon(Icons.close, color: Colors.red,);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _lerArquivo().then( (dados){
      setState(() {
        gabarito = json.decode(dados);
        Map <String, dynamic> questoes = gabarito.values.first;
        int indice = 1;
        for (var x in questoes.values){
          Questao q = new Questao();
          q.index = indice;
          q.resposta = x;
          indice += 1;
          _questoes.add(q);
        }
      });
    } );

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
        padding: EdgeInsets.all(10),
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
                        _getResultado(snapshot.data.toString());
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              child: ListView.builder(
                                  itemCount: _questoes.length,
                                  itemBuilder: (context, index){
                                    return SingleChildScrollView(
                                      padding: EdgeInsets.only(bottom: 10, top: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Text((index+1).toString(), style: TextStyle(fontSize: 22),),
                                          Text(
                                            "Resultado do sistema:    ${_questoes[index].resposta} \n"
                                                "Resultado aluno: ${_resultadoAluno[index].index} | ${_resultadoAluno[index].resposta}",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          _Icones(_questoes[index].resposta, _resultadoAluno[index].resposta),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                            ),
                          ],
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
