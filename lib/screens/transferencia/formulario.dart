import 'package:bytebank_modulo_6/components/editor.dart';
import 'package:bytebank_modulo_6/model/saldo.dart';
import 'package:bytebank_modulo_6/model/transferencia.dart';
import 'package:bytebank_modulo_6/model/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: _dicaCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
              ),
              Editor(
                dica: _dicaCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _rotuloCampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (_validaTransferencia(context, valor, numeroConta)) {
      _transferir(valor!, numeroConta!, context);
    }
  }

  void _transferir(double valor, int numeroConta, BuildContext context) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Provider.of<Transferencias>(context, listen: false)
        .adiciona(transferenciaCriada);
    Provider.of<Saldo>(context, listen: false).subtrai(valor);
    Navigator.pop(context);
  }

  _validaTransferencia(context, valor, numeroConta) {
    final _campoPreenchido = valor != null && numeroConta != null;
    final _saldoSuficiente =
        valor <= Provider.of<Saldo>(context, listen: false).valor;

    return _campoPreenchido && _saldoSuficiente;
  }
}
