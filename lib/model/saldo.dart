import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double valor;

  Saldo(this.valor);

  void adiciona(double valor){
    this.valor += valor;
    // utilizado para atualizar quem está escutando este item
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $valor';
  }
}
