import 'package:bytebank_modulo_6/model/saldo.dart';
import 'package:bytebank_modulo_6/screens/deposito/formulario_deposito.dart';
import 'package:bytebank_modulo_6/screens/dashboard/saldo_card.dart';
import 'package:bytebank_modulo_6/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          // Consumer consumido pelo click do botão para atualizar o saldo
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FormularioDeposito();
                    },
                  ),
                ),
                child: Text('Receber depósito'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FormularioTransferencia();
                    },
                  ),
                ),
                child: Text('Nova Transferência'),
              ),
            ]
          )
        ],
      ),
    );
  }
}
