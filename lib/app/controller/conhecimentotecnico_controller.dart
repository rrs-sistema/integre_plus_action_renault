import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:integre_plus_action_renault/app/page/page_imports.dart';
import 'package:integre_plus_action_renault/app/page/grid_columns/grid_columns_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';

class ConhecimentotecnicoController extends GetxController {

	// general
	final gridColumns = conhecimentotecnicoGridColumns();
	
	var conhecimentotecnicoModelList = <ConhecimentotecnicoModel>[];

	final _conhecimentotecnicoModel = ConhecimentotecnicoModel().obs;
	ConhecimentotecnicoModel get conhecimentotecnicoModel => _conhecimentotecnicoModel.value;
	set conhecimentotecnicoModel(value) => _conhecimentotecnicoModel.value = value ?? ConhecimentotecnicoModel();
	
	// list page
	late StreamSubscription _keyboardListener;
	get keyboardListener => _keyboardListener;
	set keyboardListener(value) => _keyboardListener = value;

	late PlutoGridStateManager _plutoGridStateManager;
	get plutoGridStateManager => _plutoGridStateManager;
	set plutoGridStateManager(value) => _plutoGridStateManager = value;

	final _plutoRow = PlutoRow(cells: {}).obs;
	get plutoRow => _plutoRow.value;
	set plutoRow(value) => _plutoRow.value = value;

	List<PlutoRow> plutoRows() {
		List<PlutoRow> plutoRowList = <PlutoRow>[];
		for (var conhecimentotecnicoModel in conhecimentotecnicoModelList) {
			plutoRowList.add(_getPlutoRow(conhecimentotecnicoModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(ConhecimentotecnicoModel conhecimentotecnicoModel) {
		return PlutoRow(
			cells: _getPlutoCells(conhecimentotecnicoModel: conhecimentotecnicoModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ ConhecimentotecnicoModel? conhecimentotecnicoModel}) {
		return {
			"conhecimentoid": PlutoCell(value: conhecimentotecnicoModel?.conhecimentoid ?? 0),
			"descricaoconhecimento": PlutoCell(value: conhecimentotecnicoModel?.descricaoconhecimento ?? ''),
			"nivelconhecimento": PlutoCell(value: conhecimentotecnicoModel?.nivelconhecimento ?? ''),
			"dataavaliacao": PlutoCell(value: conhecimentotecnicoModel?.dataavaliacao ?? ''),
			"colaboradorid": PlutoCell(value: conhecimentotecnicoModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		conhecimentotecnicoModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return conhecimentotecnicoModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			descricaoconhecimentoController.text = currentRow.cells['descricaoconhecimento']?.value ?? '';
			nivelconhecimentoController.text = currentRow.cells['nivelconhecimento']?.value ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => ConhecimentotecnicoEditPage());
		} else {
			showInfoSnackBar(message: 'message_select_one_to_edited'.tr);
		}
	}

	void callEditPageToInsert() {
		_plutoGridStateManager.prependNewRows(); 
		final cell = _plutoGridStateManager.rows.first.cells.entries.elementAt(0).value;
		_plutoGridStateManager.setCurrentCell(cell, 0); 
		callEditPage();	 
	}

	void handleKeyboard(PlutoKeyManagerEvent event) {
		if (event.isKeyDownEvent && event.event.logicalKey.keyId == LogicalKeyboardKey.enter.keyId) {
			callEditPage();
		}
	} 

	Future delete() async {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			showDeleteDialog(() async {
				_plutoGridStateManager.removeCurrentRow();
				userMadeChanges = true;
				refreshList();
			});
		} else {
			showInfoSnackBar(message: 'message_select_one_to_delete'.tr);
		}
	}

	// edit page
	final scrollController = ScrollController();
	final descricaoconhecimentoController = TextEditingController();
	final nivelconhecimentoController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['conhecimentoid']?.value = conhecimentotecnicoModel.conhecimentoid;
		plutoRow.cells['colaboradorid']?.value = conhecimentotecnicoModel.colaboradorid;
		plutoRow.cells['descricaoconhecimento']?.value = conhecimentotecnicoModel.descricaoconhecimento;
		plutoRow.cells['nivelconhecimento']?.value = conhecimentotecnicoModel.nivelconhecimento;
		plutoRow.cells['dataavaliacao']?.value = Util.formatDate(conhecimentotecnicoModel.dataavaliacao);
	}

	Future<void> save() async {
		final FormState form = formKey.currentState!;
		if (!form.validate()) {
			showErrorSnackBar(message: 'validator_form_message'.tr);
		} else {
			if (formWasChanged) {
				userMadeChanges = true;		 
				objectToPlutoRow();
				refreshList();
				Get.back();
			} else {
				Get.back();
			}
		}
	}

  void refreshList() {
		conhecimentotecnicoModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = ConhecimentotecnicoModel();
			model.plutoRowToObject(plutoRow);
			conhecimentotecnicoModelList.add(model);
		}
  }

	void preventDataLoss() {
		if (formWasChanged) {
			showQuestionDialog('message_data_loss'.tr, () => Get.back());
		} else {
			formWasChanged = false;
			Get.back();
		}
	}	


	// override
	@override
	void onInit() {
		bootstrapGridParameters(
			gutterSize: Constants.flutterBootstrapGutterSize,
		);
		keyboardListener = const Stream.empty().listen((event) { });
		super.onInit();
	}

	@override
	void onClose() {
		keyboardListener.cancel();
		scrollController.dispose();		 
		descricaoconhecimentoController.dispose();
		nivelconhecimentoController.dispose();
		super.onClose();
	}
}