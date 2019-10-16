
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gabarito_app/questoes.dart';
import 'questoes.dart';

class CadastrarGabarito extends StatefulWidget {
  @override
  _CadastrarGabaritoState createState() => _CadastrarGabaritoState();
}

class _CadastrarGabaritoState extends State<CadastrarGabarito> {

  int _itens = 1;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Digite o nome do gabarito",
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
                          Text(_itens.toString()),
                          Column(
                            children: <Widget>[
                              Text("A"),
                              Checkbox(
                                value: false,
                                onChanged: (bool value){
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("B"),
                              Checkbox(
                                value: false,
                                onChanged: (bool value){
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("C"),
                              Checkbox(
                                value: false,
                                onChanged: (bool value){
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("D"),
                              Checkbox(
                                value: false,
                                onChanged: (bool value){
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("E"),
                              Checkbox(
                                value: false,
                                onChanged: (bool value){
                                  setState(() {

                                  });
                                },
                              ),
                            ],
                          ),
                          Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: RaisedButton(
                onPressed: (){
                  setState(() {
                    _itens += 1;
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
                      child: Text("Adicionar questão", style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
                color: Colors.black,
                splashColor: Colors.green,
              ),
            ),
            RaisedButton(
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
          ],
        ),
      ),
    );
  }
}
