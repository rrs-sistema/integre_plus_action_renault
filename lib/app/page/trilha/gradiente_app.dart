import 'package:flutter/material.dart';
import 'package:integre_plus_action_renault/app/page/trilha/view_util_lib.dart';

gradienteApp(BuildContext context) {
  return LinearGradient(
      colors: ViewUtilLib.kitGradients,
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: const [0.0, 1.0, 0.0, 1.0],
      tileMode: TileMode.clamp);
}
