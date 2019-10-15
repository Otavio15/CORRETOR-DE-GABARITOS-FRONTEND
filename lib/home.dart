
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String menssagem = "Nenhum gabarito selecionado";
  File arquivoCamera;
  File arquivoGaleria;

  camera() async{
    arquivoCamera = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  galeria() async{
    arquivoGaleria = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitor de gabaritos"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("Imagem-reconhecida.jpg", height: 180,),
              Padding(
                padding: EdgeInsets.only(bottom: 20, top: 20),
                child: Text(
                    menssagem,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                )
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                    "Cadastrar gabarito",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                ),
                color: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  "Excluir gabarito",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                color: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  "Editar gabarito",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                color: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text(
                  "Selecionar gabarito",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
                color: Colors.green,
                shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: SpeedDial(
        backgroundColor: Colors.green,
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black54,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_enhance), backgroundColor: Colors.green,
            label: "Tirar uma foto do gabarito",
            onTap: (){
              camera();
            }
          ),
          SpeedDialChild(
              child: Icon(Icons.add_to_photos), backgroundColor: Colors.green,
              label: "Escolher uma imagem da galeria",
              onTap: (){
                galeria();
              }
          )
        ],
      )
    );
  }
}
