import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController controllerNumeroconta = TextEditingController();
  final TextEditingController controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informar transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: controllerNumeroconta,
                label: 'Número da conta',
                dica: '0000',
              ),
              Editor(
                controlador: controllerValor,
                label: 'Valor',
                dica: '0.00',
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                onPressed: () {
                  _criarTransferencia(context);
                },
                child: Text('Confirmar'),
              )
            ],
          ),
        ));
  }

  void _criarTransferencia(BuildContext context) {
    debugPrint('Clicou no botão');
    final int numeroConta = int.tryParse(controllerNumeroconta.text);
    final double valor = double.tryParse(controllerValor.text);

    debugPrint(numeroConta.toString());
    debugPrint(valor.toString());

    if (numeroConta != null && valor != null) {
      final novaTranferencia = Transferencia(valor, numeroConta);
      debugPrint('$novaTranferencia');
      Navigator.pop(context, novaTranferencia);
    }
  }
}
