
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gabarito_app/questoes.dart';
import 'questoes.dart';

class CadastrarGabarito extends StatefulWidget {
  @override
  _CadastrarGabaritoState createState() => _CadastrarGabaritoState();
}

class _CadastrarGabaritoState extends State<CadastrarGabarito> {

  int _itens = 0;
  List<Questoes> questoes;
  int _valorGrupo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
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
                  itemCount: _itens,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            (index+1).toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text("A"),
                              Radio(
                                  value: "A",
                                  groupValue: _valorGrupo,
                                  onChanged: (escolha){
                                    _valorGrupo = escolha;
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("B"),
                              Radio(
                                  value: "B",
                                  groupValue: _valorGrupo,
                                  onChanged: (escolha){
                                    _valorGrupo = escolha;
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("C"),
                              Radio(
                                  value: "C",
                                  groupValue: _valorGrupo,
                                  onChanged: (escolha){
                                    _valorGrupo = escolha;
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("D"),
                              Radio(
                                  value: "D",
                                  groupValue: _valorGrupo,
                                  onChanged: (escolha){
                                    _valorGrupo = escolha;
                                  }
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("E"),
                              Radio(
                                  value: "E",
                                  groupValue: _valorGrupo,
                                  onChanged: (escolha){
                                    _valorGrupo = escolha;
                                  }
                              )
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red,),
                            onPressed: (){},
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
                        _itens += 1;
                      });
                      Questoes q = new Questoes(_itens);
                      questoes.add(q);
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
                          child: Text("Adicionar questão", style: TextStyle(color: Colors.white),),
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
                          child: Text("Salvar gabarito", style: TextStyle(color: Colors.white),),
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
          _itens.toString(),
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
