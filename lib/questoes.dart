
import 'dart:ui';

class Questao{

  String _resposta;
  int _index;

  int get index => _index;

  set index(int value) {
    _index = value;
  }

  String get resposta => _resposta??"";

  set resposta(String value) {
    _resposta = value;
  }

}