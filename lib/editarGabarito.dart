
import 'package:flutter/material.dart';

class EditarGabarito extends StatefulWidget {
  @override
  _EditarGabaritoState createState() => _EditarGabaritoState();
}

class _EditarGabaritoState extends State<EditarGabarito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar gabarito"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Editar gabarito")
          ],
        ),
      ),
    );
  }
}
