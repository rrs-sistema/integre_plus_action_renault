import 'package:flutter/material.dart';

class MenuTituloGrupoMenuInterno extends StatelessWidget {
  final String? titulo;

  const MenuTituloGrupoMenuInterno({
    Key? key,
    this.titulo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: 40,
      child: Card(
        color: primaryColor,
        elevation: 2.0,
        child: Center(
            child: Text(titulo!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ))),
      ),
    );
  }
}
