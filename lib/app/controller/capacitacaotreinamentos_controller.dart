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

class CapacitacaotreinamentosController extends GetxController {

	// general
	final gridColumns = capacitacaotreinamentosGridColumns();
	
	var capacitacaotreinamentosModelList = <CapacitacaotreinamentosModel>[];

	final _capacitacaotreinamentosModel = CapacitacaotreinamentosModel().obs;
	CapacitacaotreinamentosModel get capacitacaotreinamentosModel => _capacitacaotreinamentosModel.value;
	set capacitacaotreinamentosModel(value) => _capacitacaotreinamentosModel.value = value ?? CapacitacaotreinamentosModel();
	
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
		for (var capacitacaotreinamentosModel in capacitacaotreinamentosModelList) {
			plutoRowList.add(_getPlutoRow(capacitacaotreinamentosModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(CapacitacaotreinamentosModel capacitacaotreinamentosModel) {
		return PlutoRow(
			cells: _getPlutoCells(capacitacaotreinamentosModel: capacitacaotreinamentosModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ CapacitacaotreinamentosModel? capacitacaotreinamentosModel}) {
		return {
			"treinamentoid": PlutoCell(value: capacitacaotreinamentosModel?.treinamentoid ?? 0),
			"nometreinamento": PlutoCell(value: capacitacaotreinamentosModel?.nometreinamento ?? ''),
			"dataconclusao": PlutoCell(value: capacitacaotreinamentosModel?.dataconclusao ?? ''),
			"certificado": PlutoCell(value: capacitacaotreinamentosModel?.certificado ?? ''),
			"colaboradorid": PlutoCell(value: capacitacaotreinamentosModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		capacitacaotreinamentosModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return capacitacaotreinamentosModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			nometreinamentoController.text = currentRow.cells['nometreinamento']?.value ?? '';
			certificadoController.text = currentRow.cells['certificado']?.value ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => CapacitacaotreinamentosEditPage());
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
	final nometreinamentoController = TextEditingController();
	final certificadoController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['treinamentoid']?.value = capacitacaotreinamentosModel.treinamentoid;
		plutoRow.cells['colaboradorid']?.value = capacitacaotreinamentosModel.colaboradorid;
		plutoRow.cells['nometreinamento']?.value = capacitacaotreinamentosModel.nometreinamento;
		plutoRow.cells['dataconclusao']?.value = Util.formatDate(capacitacaotreinamentosModel.dataconclusao);
		plutoRow.cells['certificado']?.value = capacitacaotreinamentosModel.certificado;
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
		capacitacaotreinamentosModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = CapacitacaotreinamentosModel();
			model.plutoRowToObject(plutoRow);
			capacitacaotreinamentosModelList.add(model);
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
		nometreinamentoController.dispose();
		certificadoController.dispose();
		super.onClose();
	}
}