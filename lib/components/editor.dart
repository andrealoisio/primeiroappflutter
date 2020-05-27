import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String label;
  final String dica;
  final IconData icone;

  const Editor({this.controlador, this.label, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: label,
          hintText: dica,
          icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}