
import 'package:flutter/material.dart';

class SelecionarGabarito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecionar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Selecionar gabarito")
          ],
        ),
      ),
    );
  }
}
