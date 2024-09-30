import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:integre_plus_action_renault/app/controller/controller_imports.dart';
import 'package:integre_plus_action_renault/app/routes/app_routes.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:integre_plus_action_renault/app/page/page_imports.dart';
import 'package:integre_plus_action_renault/app/page/grid_columns/grid_columns_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';

class FeedbacksupervisoresController extends GetxController {

	// general
	final gridColumns = feedbacksupervisoresGridColumns();
	
	var feedbacksupervisoresModelList = <FeedbacksupervisoresModel>[];

	final _feedbacksupervisoresModel = FeedbacksupervisoresModel().obs;
	FeedbacksupervisoresModel get feedbacksupervisoresModel => _feedbacksupervisoresModel.value;
	set feedbacksupervisoresModel(value) => _feedbacksupervisoresModel.value = value ?? FeedbacksupervisoresModel();
	
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
		for (var feedbacksupervisoresModel in feedbacksupervisoresModelList) {
			plutoRowList.add(_getPlutoRow(feedbacksupervisoresModel));
		}
		return plutoRowList;
	}

	PlutoRow _getPlutoRow(FeedbacksupervisoresModel feedbacksupervisoresModel) {
		return PlutoRow(
			cells: _getPlutoCells(feedbacksupervisoresModel: feedbacksupervisoresModel),
		);
	}

	Map<String, PlutoCell> _getPlutoCells({ FeedbacksupervisoresModel? feedbacksupervisoresModel}) {
		return {
			"feedbackid": PlutoCell(value: feedbacksupervisoresModel?.feedbackid ?? 0),
			"supervisores": PlutoCell(value: feedbacksupervisoresModel?.supervisoresModel?.nome ?? ''),
			"feedback": PlutoCell(value: feedbacksupervisoresModel?.feedback ?? ''),
			"datafeedback": PlutoCell(value: feedbacksupervisoresModel?.datafeedback ?? ''),
			"colaboradorid": PlutoCell(value: feedbacksupervisoresModel?.colaboradorid ?? 0),
			"supervisoridSupervisores": PlutoCell(value: feedbacksupervisoresModel?.supervisoridSupervisores ?? 0),
		};
	}

	void plutoRowToObject() {
		feedbacksupervisoresModel.plutoRowToObject(plutoRow);
	}

	Future loadData() async {
		_plutoGridStateManager.setShowLoading(true);
		_plutoGridStateManager.removeAllRows();
		_plutoGridStateManager.appendRows(plutoRows());
		_plutoGridStateManager.setShowLoading(false);
	}

	Future getList({Filter? filter}) async {
		return feedbacksupervisoresModelList;
	}

	void callEditPage() {
		final currentRow = _plutoGridStateManager.currentRow;
		if (currentRow != null) {
			supervisoresModelController.text = currentRow.cells['supervisores']?.value ?? '';
			feedbackController.text = currentRow.cells['feedback']?.value ?? '';
			plutoRow = currentRow;
			formWasChanged = false;
			plutoRowToObject();
			Get.to(() => FeedbacksupervisoresEditPage());
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
	final supervisoresModelController = TextEditingController();
	final feedbackController = TextEditingController();

	final scaffoldKey = GlobalKey<ScaffoldState>();
	final formKey = GlobalKey<FormState>();

	final _formWasChanged = false.obs;
	get formWasChanged => _formWasChanged.value;
	set formWasChanged(value) => _formWasChanged.value = value; 

	final _userMadeChanges = false.obs;
	get userMadeChanges => _userMadeChanges.value;
	set userMadeChanges(value) => _userMadeChanges.value = value; 

	void objectToPlutoRow() {
		plutoRow.cells['feedbackid']?.value = feedbacksupervisoresModel.feedbackid;
		plutoRow.cells['colaboradorid']?.value = feedbacksupervisoresModel.colaboradorid;
		plutoRow.cells['supervisoridSupervisores']?.value = feedbacksupervisoresModel.supervisoridSupervisores;
		plutoRow.cells['supervisores']?.value = feedbacksupervisoresModel.supervisoresModel?.nome;
		plutoRow.cells['feedback']?.value = feedbacksupervisoresModel.feedback;
		plutoRow.cells['datafeedback']?.value = Util.formatDate(feedbacksupervisoresModel.datafeedback);
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
		feedbacksupervisoresModelList.clear();
		for (var plutoRow in _plutoGridStateManager.rows) {
			var model = FeedbacksupervisoresModel();
			model.plutoRowToObject(plutoRow);
			feedbacksupervisoresModelList.add(model);
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

	Future callSupervisoresLookup() async { 
		final lookupController = Get.find<LookupController>(); 
		lookupController.refreshItems(standardValue: '%'); 
		lookupController.title = '${'lookup_page_title'.tr} [Supervisorid Supervisores]'; 
		lookupController.route = '/supervisores/'; 
		lookupController.gridColumns = supervisoresGridColumns(isForLookup: true); 
		lookupController.aliasColumns = SupervisoresModel.aliasColumns; 
		lookupController.dbColumns = SupervisoresModel.dbColumns; 

		final plutoRowResult = await Get.toNamed(Routes.lookupPage); 
		if (plutoRowResult != null) { 
			feedbacksupervisoresModel.supervisoridSupervisores = plutoRowResult.cells['id']!.value; 
			feedbacksupervisoresModel.supervisoresModel!.plutoRowToObject(plutoRowResult); 
			supervisoresModelController.text = feedbacksupervisoresModel.supervisoresModel?.nome ?? ''; 
			formWasChanged = true; 
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
		supervisoresModelController.dispose();
		feedbackController.dispose();
		super.onClose();
	}
}