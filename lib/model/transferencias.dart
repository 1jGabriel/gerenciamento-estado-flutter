import 'package:bytebank_modulo_6/model/transferencia.dart';
import 'package:flutter/cupertino.dart';

class Transferencias extends ChangeNotifier {
  final List<Transferencia> transferencias = [];

  adiciona(Transferencia transferencia) {
    transferencias.add(transferencia);
    notifyListeners();
  }
}
