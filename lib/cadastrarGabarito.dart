
import 'package:flutter/material.dart';

class CadastrarGabarito extends StatefulWidget {
  @override
  _CadastrarGabaritoState createState() => _CadastrarGabaritoState();
}

class _CadastrarGabaritoState extends State<CadastrarGabarito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Cadastrar gabarito")
          ],
        ),
      )
    );
  }
}
