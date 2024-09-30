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

class ResolucaoproblemasController extends GetxController {

	// general
	final gridColumns = resolucaoproblemasGridColumns();
	
	var resolucaoproblemasModelList = <ResolucaoproblemasModel>[];

	final _resolucaoproblemasModel = ResolucaoproblemasModel().obs;
	ResolucaoproblemasModel get resolucaoproblemasModel => _resolucaoproblemasModel.value;
	set resolucaoproblemasModel(value) => _resolucaoproblemasModel.value = value ?? ResolucaoproblemasModel();
	
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
		for (var resolucaoproblemasModel in resolucaoproblemasModelList) {
			plutoRowList.add(_getPlutoRow(resolucaoproblemasModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(ResolucaoproblemasModel resolucaoproblemasModel) {
		return PlutoRow(
			cells: _getPlutoCells(resolucaoproblemasModel: resolucaoproblemasModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ ResolucaoproblemasModel? resolucaoproblemasModel}) {
		return {
			"resolucaoid": PlutoCell(value: resolucaoproblemasModel?.resolucaoid ?? 0),
			"descricaoproblemaresolvido": PlutoCell(value: resolucaoproblemasModel?.descricaoproblemaresolvido ?? ''),
			"dataresolucao": PlutoCell(value: resolucaoproblemasModel?.dataresolucao ?? ''),
			"avaliacaoresolucao": PlutoCell(value: resolucaoproblemasModel?.avaliacaoresolucao ?? 0),
			"colaboradorid": PlutoCell(value: resolucaoproblemasModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		resolucaoproblemasModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return resolucaoproblemasModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			descricaoproblemaresolvidoController.text = currentRow.cells['descricaoproblemaresolvido']?.value ?? '';
			avaliacaoresolucaoController.text = currentRow.cells['avaliacaoresolucao']?.value?.toString() ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => ResolucaoproblemasEditPage());
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
	final descricaoproblemaresolvidoController = TextEditingController();
	final avaliacaoresolucaoController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['resolucaoid']?.value = resolucaoproblemasModel.resolucaoid;
		plutoRow.cells['colaboradorid']?.value = resolucaoproblemasModel.colaboradorid;
		plutoRow.cells['descricaoproblemaresolvido']?.value = resolucaoproblemasModel.descricaoproblemaresolvido;
		plutoRow.cells['dataresolucao']?.value = Util.formatDate(resolucaoproblemasModel.dataresolucao);
		plutoRow.cells['avaliacaoresolucao']?.value = resolucaoproblemasModel.avaliacaoresolucao;
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
		resolucaoproblemasModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = ResolucaoproblemasModel();
			model.plutoRowToObject(plutoRow);
			resolucaoproblemasModelList.add(model);
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
		descricaoproblemaresolvidoController.dispose();
		avaliacaoresolucaoController.dispose();
		super.onClose();
	}
}