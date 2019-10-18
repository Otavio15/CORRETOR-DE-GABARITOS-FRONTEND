
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gabarito_app/questoes.dart';
import 'questoes.dart';

class CadastrarGabarito extends StatefulWidget {
  @override
  _CadastrarGabaritoState createState() => _CadastrarGabaritoState();
}

class _CadastrarGabaritoState extends State<CadastrarGabarito> {

  List<Questao> _questoes = [];
  var _controller = ScrollController();
  TextEditingController _nomeController = new TextEditingController();

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
                      padding: EdgeInsets.only(top: 10, bottom: 10),
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
                        _questao.resposta = "";
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
                        return showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              backgroundColor: Colors.black,
                              title: Text("Por favor, digite um nome para o gabarito.", style: TextStyle(color: Colors.white),),
                            );
                          }
                        );
                      }
                      else{
                        
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
