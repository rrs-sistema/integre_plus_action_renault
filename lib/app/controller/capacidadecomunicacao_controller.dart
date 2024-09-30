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

class CapacidadecomunicacaoController extends GetxController {

	// general
	final gridColumns = capacidadecomunicacaoGridColumns();
	
	var capacidadecomunicacaoModelList = <CapacidadecomunicacaoModel>[];

	final _capacidadecomunicacaoModel = CapacidadecomunicacaoModel().obs;
	CapacidadecomunicacaoModel get capacidadecomunicacaoModel => _capacidadecomunicacaoModel.value;
	set capacidadecomunicacaoModel(value) => _capacidadecomunicacaoModel.value = value ?? CapacidadecomunicacaoModel();
	
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
		for (var capacidadecomunicacaoModel in capacidadecomunicacaoModelList) {
			plutoRowList.add(_getPlutoRow(capacidadecomunicacaoModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(CapacidadecomunicacaoModel capacidadecomunicacaoModel) {
		return PlutoRow(
			cells: _getPlutoCells(capacidadecomunicacaoModel: capacidadecomunicacaoModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ CapacidadecomunicacaoModel? capacidadecomunicacaoModel}) {
		return {
			"comunicacaoid": PlutoCell(value: capacidadecomunicacaoModel?.comunicacaoid ?? 0),
			"avaliacaocomunicacao": PlutoCell(value: capacidadecomunicacaoModel?.avaliacaocomunicacao ?? 0),
			"feedbackcomunicacao": PlutoCell(value: capacidadecomunicacaoModel?.feedbackcomunicacao ?? ''),
			"dataavaliacao": PlutoCell(value: capacidadecomunicacaoModel?.dataavaliacao ?? ''),
			"colaboradorid": PlutoCell(value: capacidadecomunicacaoModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		capacidadecomunicacaoModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return capacidadecomunicacaoModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			avaliacaocomunicacaoController.text = currentRow.cells['avaliacaocomunicacao']?.value?.toString() ?? '';
			feedbackcomunicacaoController.text = currentRow.cells['feedbackcomunicacao']?.value ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => CapacidadecomunicacaoEditPage());
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
	final avaliacaocomunicacaoController = TextEditingController();
	final feedbackcomunicacaoController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['comunicacaoid']?.value = capacidadecomunicacaoModel.comunicacaoid;
		plutoRow.cells['colaboradorid']?.value = capacidadecomunicacaoModel.colaboradorid;
		plutoRow.cells['avaliacaocomunicacao']?.value = capacidadecomunicacaoModel.avaliacaocomunicacao;
		plutoRow.cells['feedbackcomunicacao']?.value = capacidadecomunicacaoModel.feedbackcomunicacao;
		plutoRow.cells['dataavaliacao']?.value = Util.formatDate(capacidadecomunicacaoModel.dataavaliacao);
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
		capacidadecomunicacaoModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = CapacidadecomunicacaoModel();
			model.plutoRowToObject(plutoRow);
			capacidadecomunicacaoModelList.add(model);
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
		avaliacaocomunicacaoController.dispose();
		feedbackcomunicacaoController.dispose();
		super.onClose();
	}
}