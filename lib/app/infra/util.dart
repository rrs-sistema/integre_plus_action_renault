import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

class Util {
  Util._();

  /// remove mask from a string
  static String? removeMask(dynamic value) {
    if (value != null) {
      return value.replaceAll(RegExp(r'[^\w\s]+'), '');
    } else {
      return null;
    }
  }

  /// sets the distance between columns in case there is a line break
  static EdgeInsets? distanceBetweenColumnsLineBreak(BuildContext context) {
    return bootStrapValueBasedOnSize(
      sizes: {
        "xl": EdgeInsets.zero,
        "lg": EdgeInsets.zero,
        "md": EdgeInsets.zero,
        "sm": EdgeInsets.zero,
        "": const EdgeInsets.only(top: 5.0, bottom: 10.0),
      },
      context: context,
    );
  }

  /// define o que é a tela pequena e se o dispositivo utilizado tem a tela pequena
  static bool? isTelaPequena(BuildContext context) {
    return bootStrapValueBasedOnSize(
      sizes: {
        "xl": false,
        "lg": false,
        "md": false,
        "sm": false,
        "": true,
      },
      context: context,
    );
  }

  static String formatDate(DateTime? date) {
    if (date == null) {
      return '';
    } else {
      var formatter = DateFormat('dd/MM/yyyy');
      String dataFormatada = formatter.format(date);
      return dataFormatada;
    }
  }

  static DateTime? stringToDate(String? date) {
    if (date == null || date == '') {
      return null;
    } else {
      var formatter = DateFormat('dd/MM/yyyy');
      return formatter.parseStrict(date);
    }
  }

  static String moneyFormat(dynamic value) {
    final formatter = NumberFormat.simpleCurrency(locale: Get.locale.toString());
    final result = formatter.format(value);
    return result;
  }

  static String decimalFormat(dynamic value) {
    final formatter = NumberFormat.decimalPattern(Get.locale.toString());
    final result = formatter.format(value);
    return result;
  }

  static String stringFormat(dynamic value) {
    if (value != null) {
      if (value == true) {
        return 'true';
      } else if (value == false) {
        return 'false';
      }
    }
    return value ?? "";
  }

  static num stringToNumberWithLocale(String value) {
    final formatter = NumberFormat.simpleCurrency(locale: Get.locale.toString());
    value = value.isEmpty ? '0' : value;
    final result = formatter.parse(value);
    return result;
  }

  static String crypt(String value) {
    return value;
  }

  static String decrypt(String value) {
    return value;
  }

  static String toJsonString(List<dynamic> driftList) {
    String jsonString = "[";
    for (var i = 0; i < driftList.length; i++) {
      jsonString += "{";
      for (var j = 0; j < driftList[i].data.length; j++) {
        String fieldName = driftList[i].data.keys.toList()[j];
        final value = driftList[i].data.values.toList()[j];
        jsonString += '"${fieldName.camelCase}": "$value",';
      }
      jsonString = jsonString.substring(0, jsonString.length - 1);
      jsonString += "},";
    }
    if (driftList.isNotEmpty) {
      jsonString = jsonString.substring(0, jsonString.length - 1);
    }
    jsonString += "]";
    return jsonString;
  }
}
