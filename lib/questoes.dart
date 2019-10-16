
class Questoes{

  int _numeroQuestoes;
  bool _questaoA = false;
  bool _questaoB = false;
  bool _questaoC = false;
  bool _questaoD = false;
  bool _questaoE = false;

  Questoes(int _numeroQuestoes){
    this._numeroQuestoes = numeroQuestoes;
  }

  bool get questaoE => _questaoE;

  bool get questaoD => _questaoD;

  bool get questaoC => _questaoC;

  bool get questaoB => _questaoB;

  bool get questaoA => _questaoA;

  int get numeroQuestoes => _numeroQuestoes;

  set questaoE(bool value) {
    _questaoE = value;
  }

  set questaoD(bool value) {
    _questaoD = value;
  }

  set questaoC(bool value) {
    _questaoC = value;
  }

  set questaoB(bool value) {
    _questaoB = value;
  }

  set questaoA(bool value) {
    _questaoA = value;
  }

  set numeroQuestoes(int value) {
    _numeroQuestoes = value;
  }

}