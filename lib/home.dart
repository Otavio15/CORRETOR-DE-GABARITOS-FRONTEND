
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gabarito_app/api.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_cropper/image_cropper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  File _imagem;

  String _menssagem = "Nenhuma imagem selecionada";
  Color _corMenssagem = Colors.red;

  Future<void> _getImage(ImageSource source) async{
    File _imgSelecionada = await ImagePicker.pickImage(source: source);

    setState(() {
      _imagem = _imgSelecionada;
      if (_imagem.path.isNotEmpty){
        _menssagem = "Imagem selecionada";
        _corMenssagem = Colors.green;
      }
    });
  }

  Future<void> _cortarImagem() async{
    File _cortar = await ImageCropper.cropImage(
      sourcePath: _imagem.path,
      toolbarTitle: "Cortar imagem",
    );

    setState(() {
      _imagem = _cortar ?? _imagem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corretor de gabaritos"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15, top: 15),
                child: Text(
                    _menssagem,
                    style: TextStyle(
                      fontSize: 22,
                      color: _corMenssagem,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      _getImage(ImageSource.camera);
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.camera_enhance,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Tirar uma foto", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    color: Colors.black,
                    splashColor: Colors.green,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: RaisedButton(
                      onPressed: (){
                        _getImage(ImageSource.gallery);
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.folder,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text("Procurar imagens na galeria", style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                      color: Colors.black,
                      splashColor: Colors.green,
                    ),
                  ),
                  RaisedButton(
                    onPressed: (){
                      _cortarImagem();
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Icon(
                            Icons.content_cut,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("Cortar imagem", style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    color: Colors.black,
                    splashColor: Colors.green,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: (){
                        Api api = new Api();
                        api.uploadFile(_imagem);
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text("Corrigir gabarito", style: TextStyle(color: Colors.white),),
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
          ),
        ],
      )
    );
  }
}
