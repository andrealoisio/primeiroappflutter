import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transferências'),
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              final Future<Transferencia> future =
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FormularioTransferencia();
              }));
              future.then(
                (transferencia) {
                  debugPrint('Cheguei dentro do then');
                  if (transferencia != null) {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        widget._transferencias.add(transferencia);
                      });
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Are you talkin\' to me?')));
                    });
                  }
                },
              );
            },
            child: Icon(Icons.monetization_on),
          ),
        )

        /*FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferencia) {
            debugPrint('Cheguei dentro do then');
            if (transferencia != null) {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  widget._transferencias.add(transferencia);
                });
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Are you talkin\' to me?')));
              });
            }
          });
        },
        child: Icon(Icons.monetization_on),
      ), */
        );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
