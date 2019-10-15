
import 'package:flutter/cupertino.dart';
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
    print("ooo $arquivoCamera");
  }

  galeria() async{
    arquivoGaleria = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("ooo $arquivoGaleria");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corretor de gabaritos"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("Imagem-reconhecida.jpg", height: 170,),
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                child: Text(
                    menssagem,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      camera();
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Tirar uma foto", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    color: Colors.black,
                    splashColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: (){
                        galeria();
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.folder,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text("Procurar imagens na galeria", style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                      color: Colors.black,
                      splashColor: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

      floatingActionButton: SpeedDial(
        backgroundColor: Colors.green,
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black12,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add), backgroundColor: Colors.green,
            label: "Cadastrar gabarito",
            onTap: (){
              Navigator.pushNamed(context, "/cadastrarGabarito");
            }
          ),
          SpeedDialChild(
              child: Icon(Icons.remove), backgroundColor: Colors.green,
              label: "Excluir gabarito",
              onTap: (){
                Navigator.pushNamed(context, "/excluirGabarito");
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.edit), backgroundColor: Colors.green,
              label: "Editar gabarito",
              onTap: (){
                Navigator.pushNamed(context, "/editarGabarito");
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.adjust), backgroundColor: Colors.green,
              label: "Selecionar gabarito",
              onTap: (){
                Navigator.pushNamed(context, "/selecionarGabarito");
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.art_track), backgroundColor: Colors.green,
              label: "Resultados",
              onTap: (){
                Navigator.pushNamed(context, "/resultados");
              }
          )
        ],
      )
    );
  }
}
