import 'package:bytebank_modulo_6/model/saldo.dart';
import 'package:bytebank_modulo_6/screens/saldo.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SaldoCard(
            Saldo(20.00),
          ),
        ));
  }
}