
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gabarito_app/cadastrarGabarito.dart';
import 'package:gabarito_app/editarGabarito.dart';
import 'package:gabarito_app/excluirGabarito.dart';
import 'package:gabarito_app/home.dart';
import 'package:gabarito_app/resultados.dart';
import 'package:gabarito_app/selecionarGabarito.dart';
import 'resultado.dart';

void main(){
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/cadastrarGabarito" : (context) => CadastrarGabarito(),
        "/excluirGabarito" : (context) => ExcluirGabarito(),
        "/editarGabarito" : (context) => EditarGabarito(),
        "/selecionarGabarito" : (context) => SelecionarGabarito(),
        "/resultados" : (context) => Resultados(),
        "/resultado" : (context) => Resultado()
      },
      home: Home(),
    )
  );
}

