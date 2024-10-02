import 'package:flutter/material.dart';

class ViewUtilLib {
  /// singleton
  factory ViewUtilLib() {
    _this ??= ViewUtilLib._();
    return _this!;
  }
  static ViewUtilLib? _this;
  ViewUtilLib._() : super();

// #region Ícones
  static Icon getIconBotaoExcluir() {
    return const Icon(Icons.delete, color: Colors.white);
  }

  static Icon getIconBotaoAlterar() {
    return const Icon(Icons.edit, color: Colors.white);
  }

  static Icon getIconBotaoInserir() {
    return const Icon(Icons.add);
  }

  static Icon getIconBotaoFiltro() {
    return const Icon(Icons.filter);
  }

  static Icon getIconBotaoPdf() {
    return const Icon(Icons.picture_as_pdf);
  }

  static Icon getIconBotaoSalvar() {
    return const Icon(Icons.save, color: Colors.white);
  }

  static Icon getIconBotaoLookup() {
    return const Icon(Icons.search);
  }

  static const primaryColor = Colors.grey;

  static Color getBackgroundColorCardValor(num valor) {
    if (valor == 0) {
      return Colors.blue.shade100;
    } else if (valor > 0) {
      return Colors.green.shade100;
    } else {
      return Colors.red.shade100;
    }
  }

  static List<Color> kitGradients = [
    Colors.grey[400]!, // Cinza claro
    Colors.grey[500]!, // Cinza claro
    Colors.grey,
    Colors.blueGrey[100]!, // Cinza claro
    /*
    primaryColor,
    Colors.blue.shade900,
    */
  ];

// #endregion Cores

// #region Padding
  static EdgeInsets paddingBootstrapContainerTelaPequena =
      const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0);
  static EdgeInsets paddingBootstrapContainerTelaGrande =
      const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0);
  static EdgeInsets paddingAbaPersistePage = const EdgeInsets.symmetric(horizontal: 16.0);
// #region Padding

  static SliderThemeData sliderThemeData(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.blue[700],
      inactiveTrackColor: Colors.blue[100],
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
      thumbColor: Colors.blueAccent,
      overlayColor: Colors.blue.withAlpha(32),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      activeTickMarkColor: Colors.blue[700],
      inactiveTickMarkColor: Colors.blue[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorColor: Colors.blueAccent,
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
