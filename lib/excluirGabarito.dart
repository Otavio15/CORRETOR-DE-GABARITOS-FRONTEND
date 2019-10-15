
import 'package:flutter/material.dart';

class ExcluirGabarito extends StatefulWidget {
  @override
  _ExcluirGabaritoState createState() => _ExcluirGabaritoState();
}

class _ExcluirGabaritoState extends State<ExcluirGabarito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Excluir gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("excluir")
          ],
        ),
      ),
    );
  }
}
