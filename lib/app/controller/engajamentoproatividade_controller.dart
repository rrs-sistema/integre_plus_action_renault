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

class EngajamentoproatividadeController extends GetxController {
  // general
  final gridColumns = engajamentoproatividadeGridColumns();

  var engajamentoproatividadeModelList = <EngajamentoproatividadeModel>[];

  final _engajamentoproatividadeModel = EngajamentoproatividadeModel().obs;
  EngajamentoproatividadeModel get engajamentoproatividadeModel =>
      _engajamentoproatividadeModel.value;
  set engajamentoproatividadeModel(value) =>
      _engajamentoproatividadeModel.value = value ?? EngajamentoproatividadeModel();

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
    for (var engajamentoproatividadeModel in engajamentoproatividadeModelList) {
      plutoRowList.add(_getPlutoRow(engajamentoproatividadeModel));
    }
    return plutoRowList;
  }

  PlutoRow _getPlutoRow(EngajamentoproatividadeModel engajamentoproatividadeModel) {
    return PlutoRow(
      cells: _getPlutoCells(engajamentoproatividadeModel: engajamentoproatividadeModel),
    );
  }

  Map<String, PlutoCell> _getPlutoCells(
      {EngajamentoproatividadeModel? engajamentoproatividadeModel}) {
    return {
      "engajamentoid": PlutoCell(value: engajamentoproatividadeModel?.engajamentoid ?? 0),
      "pontuacaoengajamento":
          PlutoCell(value: engajamentoproatividadeModel?.pontuacaoengajamento ?? 0),
      "propostasmelhoria ": PlutoCell(value: engajamentoproatividadeModel?.propostasmelhoria ?? 0),
      "dataavaliacao": PlutoCell(value: engajamentoproatividadeModel?.dataavaliacao ?? ''),
      "colaboradorid": PlutoCell(value: engajamentoproatividadeModel?.colaboradorid ?? 0),
    };
  }

  void plutoRowToObject() {
    engajamentoproatividadeModel.plutoRowToObject(plutoRow);
  }

  Future loadData() async {
    _plutoGridStateManager.setShowLoading(true);
    _plutoGridStateManager.removeAllRows();
    _plutoGridStateManager.appendRows(plutoRows());
    _plutoGridStateManager.setShowLoading(false);
  }

  Future getList({Filter? filter}) async {
    return engajamentoproatividadeModelList;
  }

  void callEditPage() {
    final currentRow = _plutoGridStateManager.currentRow;
    if (currentRow != null) {
      pontuacaoengajamentoController.text =
          currentRow.cells['pontuacaoengajamento']?.value?.toString() ?? '';
      propostasmelhoriaController.text =
          currentRow.cells['propostasmelhoria ']?.value?.toString() ?? '';
      plutoRow = currentRow;
      formWasChanged = false;
      plutoRowToObject();
      Get.to(() => EngajamentoproatividadeEditPage());
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
  final pontuacaoengajamentoController = TextEditingController();
  final propostasmelhoriaController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final _formWasChanged = false.obs;
  get formWasChanged => _formWasChanged.value;
  set formWasChanged(value) => _formWasChanged.value = value;

  final _userMadeChanges = false.obs;
  get userMadeChanges => _userMadeChanges.value;
  set userMadeChanges(value) => _userMadeChanges.value = value;

  void objectToPlutoRow() {
    plutoRow.cells['engajamentoid']?.value = engajamentoproatividadeModel.engajamentoid;
    plutoRow.cells['colaboradorid']?.value = engajamentoproatividadeModel.colaboradorid;
    plutoRow.cells['pontuacaoengajamento']?.value =
        engajamentoproatividadeModel.pontuacaoengajamento;
    plutoRow.cells['propostasmelhoria ']?.value = engajamentoproatividadeModel.propostasmelhoria;
    plutoRow.cells['dataavaliacao']?.value =
        Util.formatDate(engajamentoproatividadeModel.dataavaliacao);
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
    engajamentoproatividadeModelList.clear();
    for (var plutoRow in _plutoGridStateManager.rows) {
      var model = EngajamentoproatividadeModel();
      model.plutoRowToObject(plutoRow);
      engajamentoproatividadeModelList.add(model);
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
    keyboardListener = const Stream.empty().listen((event) {});
    super.onInit();
  }

  @override
  void onClose() {
    keyboardListener.cancel();
    scrollController.dispose();
    pontuacaoengajamentoController.dispose();
    propostasmelhoriaController.dispose();
    super.onClose();
  }
}
