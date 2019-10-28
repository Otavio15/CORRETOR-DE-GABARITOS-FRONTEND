
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gabarito_app/questoes.dart';
import 'package:toast/toast.dart';
import 'questoes.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class CadastrarGabarito extends StatefulWidget {
  @override
  _CadastrarGabaritoState createState() => _CadastrarGabaritoState();
}

class _CadastrarGabaritoState extends State<CadastrarGabarito> {

  List<Questao> _questoes = [];

  var _controller = ScrollController();

  TextEditingController _nomeController = new TextEditingController();

  Map<String, dynamic> gabarito;

  _escolherCor(index){
    if (index % 2 == 0){
      return Colors.black12;
    }
    else{
      return Colors.white;
    }
  }

  _alerta(menssagem){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(menssagem, style: TextStyle(color: Colors.white),),
          );
        }
    );
  }

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File( "${diretorio.path}/dados.json" );
  }

  _salvarArquivo() async {

    var arquivo = await _getFile();

    //Criar dados
    gabarito = Map();

    for (var i in _questoes){
      gabarito[i.index.toString()] = i.resposta;
    }

    String dados = json.encode( {_nomeController.text:gabarito} );
    arquivo.writeAsString( dados );

    print("Salvo");

  }

  _lerArquivo() async {
    try{
      final arquivo = await _getFile();
      return arquivo.readAsString();
    }catch(e){
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _lerArquivo().then( (dados){
      setState(() {
        gabarito = json.decode(dados);
        _nomeController.text = gabarito.keys.first;

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                    labelText: "Digite o nome do gabarito",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0)
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 20
                    )
                ),

              ),
            ),
            Expanded(
              child: ListView.builder(
                  controller: _controller,
                  itemCount: _questoes.length,
                  semanticChildCount: _questoes.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(top: 3, bottom: 2),
                      color: _escolherCor(index),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            (index+1).toString(),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text("A"),
                              Radio(
                                  activeColor: Colors.green,
                                  value: "A",
                                  groupValue: _questoes[index].resposta,
                                  onChanged: (escolha){
                                    setState(() {
                                      _questoes[index].resposta = escolha;
                                      _questoes[index].index = (index+1);
                                    });
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("B"),
                              Radio(
                                  activeColor: Colors.green,
                                  value: "B",
                                  groupValue: _questoes[index].resposta,
                                  onChanged: (escolha){
                                    setState(() {
                                      _questoes[index].resposta = escolha;
                                      _questoes[index].index = (index+1);
                                    });
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("C"),
                              Radio(
                                  activeColor: Colors.green,
                                  value: "C",
                                  groupValue: _questoes[index].resposta,
                                  onChanged: (escolha){
                                    setState(() {
                                      _questoes[index].resposta = escolha;
                                      _questoes[index].index = (index+1);
                                    });
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("D"),
                              Radio(
                                  activeColor: Colors.green,
                                  value: "D",
                                  groupValue: _questoes[index].resposta,
                                  onChanged: (escolha){
                                    setState(() {
                                      _questoes[index].resposta = escolha;
                                      _questoes[index].index = (index+1);
                                    });
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("E"),
                              Radio(
                                  activeColor: Colors.green,
                                  value: "E",
                                  groupValue: _questoes[index].resposta,
                                  onChanged: (escolha){
                                    setState(() {
                                      _questoes[index].resposta = escolha;
                                      _questoes[index].index = (index+1);
                                    });
                                  }
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red,),
                            onPressed: (){
                              setState(() {
                                _questoes.removeAt(index);
                              });
                            },
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                    onPressed: (){
                      setState(() {
                        Questao _questao = new Questao();
                        _questoes.add(_questao);
                        _controller.animateTo(_controller.offset + 100,
                            curve: Curves.linear, duration: Duration(milliseconds: 300));
                      });
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Adicionar", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    color: Colors.black,
                    splashColor: Colors.green,
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: RaisedButton(
                    onPressed: (){
                      if (_nomeController.text.isEmpty){
                        _alerta("Por favor, digite um nome para o gabarito.");
                      }
                      else{
                        _salvarArquivo();
                        Navigator.pop(context);
                        Toast.show("Gabarito salvo!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.save,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Salvar", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    color: Colors.black,
                    splashColor: Colors.green,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          _questoes.length.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}