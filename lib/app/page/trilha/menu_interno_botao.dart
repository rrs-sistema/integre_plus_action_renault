// ignore_for_file: unnecessary_question_mark

import 'package:flutter/material.dart';

class MenuInternoBotao extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final Color iconColor;
  final Function? onPressed;
  final Color? circleColor;
  final bool isCircleEnabled;
  final double betweenHeight;
  final String? rota;
  final RouteSettings? settings;

  // ignore: use_key_in_widget_constructors
  const MenuInternoBotao(
      {Key? key,
      this.label,
      this.icon,
      this.onPressed,
      this.iconColor = Colors.white,
      this.circleColor,
      this.isCircleEnabled = true,
      this.rota,
      this.settings,
      this.betweenHeight = 5.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          //abrirJanela(context, rota, settings);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isCircleEnabled
              ? CircleAvatar(
                  backgroundColor: circleColor,
                  radius: 20.0,
                  child: Icon(
                    icon,
                    size: 18.0,
                    color: iconColor,
                  ),
                )
              : Icon(
                  icon,
                  size: 18.0,
                  color: iconColor,
                ),
          SizedBox(
            height: betweenHeight,
          ),
          Text(
            label!,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
