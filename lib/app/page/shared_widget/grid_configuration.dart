import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/infra/session.dart';

PlutoGridConfiguration gridConfiguration() {
return PlutoGridConfiguration(
  enterKeyAction: PlutoGridEnterKeyAction.toggleEditing,
  style: Get.isDarkMode
	  ? const PlutoGridStyleConfig.dark()
	  : PlutoGridStyleConfig(
		  evenRowColor: Colors.grey.shade100,
		  enableGridBorderShadow: true,
		),
  localeText: Session.getLocaleForPlutoGrid(),
);
} 
