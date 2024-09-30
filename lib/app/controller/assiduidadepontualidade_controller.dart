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

class AssiduidadepontualidadeController extends GetxController {

	// general
	final gridColumns = assiduidadepontualidadeGridColumns();
	
	var assiduidadepontualidadeModelList = <AssiduidadepontualidadeModel>[];

	final _assiduidadepontualidadeModel = AssiduidadepontualidadeModel().obs;
	AssiduidadepontualidadeModel get assiduidadepontualidadeModel => _assiduidadepontualidadeModel.value;
	set assiduidadepontualidadeModel(value) => _assiduidadepontualidadeModel.value = value ?? AssiduidadepontualidadeModel();
	
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
		for (var assiduidadepontualidadeModel in assiduidadepontualidadeModelList) {
			plutoRowList.add(_getPlutoRow(assiduidadepontualidadeModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(AssiduidadepontualidadeModel assiduidadepontualidadeModel) {
		return PlutoRow(
			cells: _getPlutoCells(assiduidadepontualidadeModel: assiduidadepontualidadeModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ AssiduidadepontualidadeModel? assiduidadepontualidadeModel}) {
		return {
			"assiduidadeid": PlutoCell(value: assiduidadepontualidadeModel?.assiduidadeid ?? 0),
			"faltasinjustificadas": PlutoCell(value: assiduidadepontualidadeModel?.faltasinjustificadas ?? 0),
			"atrasos": PlutoCell(value: assiduidadepontualidadeModel?.atrasos ?? 0),
			"dataregistro": PlutoCell(value: assiduidadepontualidadeModel?.dataregistro ?? ''),
			"colaboradorid": PlutoCell(value: assiduidadepontualidadeModel?.colaboradorid ?? 0),
		};
	}

	void plutoRowToObject() {
		assiduidadepontualidadeModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return assiduidadepontualidadeModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			faltasinjustificadasController.text = currentRow.cells['faltasinjustificadas']?.value?.toString() ?? '';
			atrasosController.text = currentRow.cells['atrasos']?.value?.toString() ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => AssiduidadepontualidadeEditPage());
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
	final faltasinjustificadasController = TextEditingController();
	final atrasosController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['assiduidadeid']?.value = assiduidadepontualidadeModel.assiduidadeid;
		plutoRow.cells['colaboradorid']?.value = assiduidadepontualidadeModel.colaboradorid;
		plutoRow.cells['faltasinjustificadas']?.value = assiduidadepontualidadeModel.faltasinjustificadas;
		plutoRow.cells['atrasos']?.value = assiduidadepontualidadeModel.atrasos;
		plutoRow.cells['dataregistro']?.value = Util.formatDate(assiduidadepontualidadeModel.dataregistro);
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
		assiduidadepontualidadeModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = AssiduidadepontualidadeModel();
			model.plutoRowToObject(plutoRow);
			assiduidadepontualidadeModelList.add(model);
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
		faltasinjustificadasController.dispose();
		atrasosController.dispose();
		super.onClose();
	}
}