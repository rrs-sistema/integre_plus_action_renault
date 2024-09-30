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

class ResultadosatingidosController extends GetxController {

	// general
	final gridColumns = resultadosatingidosGridColumns();
	
	var resultadosatingidosModelList = <ResultadosatingidosModel>[];

	final _resultadosatingidosModel = ResultadosatingidosModel().obs;
	ResultadosatingidosModel get resultadosatingidosModel => _resultadosatingidosModel.value;
	set resultadosatingidosModel(value) => _resultadosatingidosModel.value = value ?? ResultadosatingidosModel();
	
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
		for (var resultadosatingidosModel in resultadosatingidosModelList) {
			plutoRowList.add(_getPlutoRow(resultadosatingidosModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(ResultadosatingidosModel resultadosatingidosModel) {
		return PlutoRow(
			cells: _getPlutoCells(resultadosatingidosModel: resultadosatingidosModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ ResultadosatingidosModel? resultadosatingidosModel}) {
		return {
			"resultadoid": PlutoCell(value: resultadosatingidosModel?.resultadoid ?? 0),
			"metasatingidas": PlutoCell(value: resultadosatingidosModel?.metasatingidas ?? 0),
			"pontuacaoprodutividade": PlutoCell(value: resultadosatingidosModel?.pontuacaoprodutividade ?? 0),
			"defeitosproduzidos": PlutoCell(value: resultadosatingidosModel?.defeitosproduzidos ?? 0),
			"dataavaliacao": PlutoCell(value: resultadosatingidosModel?.dataavaliacao ?? ''),
			"colaboradorid": PlutoCell(value: resultadosatingidosModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		resultadosatingidosModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return resultadosatingidosModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			metasatingidasController.text = currentRow.cells['metasatingidas']?.value?.toString() ?? '';
			pontuacaoprodutividadeController.text = currentRow.cells['pontuacaoprodutividade']?.value?.toString() ?? '';
			defeitosproduzidosController.text = currentRow.cells['defeitosproduzidos']?.value?.toString() ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => ResultadosatingidosEditPage());
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
	final metasatingidasController = TextEditingController();
	final pontuacaoprodutividadeController = TextEditingController();
	final defeitosproduzidosController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['resultadoid']?.value = resultadosatingidosModel.resultadoid;
		plutoRow.cells['colaboradorid']?.value = resultadosatingidosModel.colaboradorid;
		plutoRow.cells['metasatingidas']?.value = resultadosatingidosModel.metasatingidas;
		plutoRow.cells['pontuacaoprodutividade']?.value = resultadosatingidosModel.pontuacaoprodutividade;
		plutoRow.cells['defeitosproduzidos']?.value = resultadosatingidosModel.defeitosproduzidos;
		plutoRow.cells['dataavaliacao']?.value = Util.formatDate(resultadosatingidosModel.dataavaliacao);
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
		resultadosatingidosModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = ResultadosatingidosModel();
			model.plutoRowToObject(plutoRow);
			resultadosatingidosModelList.add(model);
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
		metasatingidasController.dispose();
		pontuacaoprodutividadeController.dispose();
		defeitosproduzidosController.dispose();
		super.onClose();
	}
}