import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/controller/controller_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:integre_plus_action_renault/app/page/grid_columns/grid_columns_imports.dart';

import 'package:integre_plus_action_renault/app/routes/app_routes.dart';
import 'package:integre_plus_action_renault/app/data/repository/supervisores_repository.dart';
import 'package:integre_plus_action_renault/app/page/shared_page/shared_page_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';
import 'package:integre_plus_action_renault/app/mixin/controller_base_mixin.dart';

class SupervisoresController extends GetxController with ControllerBaseMixin {
  final SupervisoresRepository supervisoresRepository;
  SupervisoresController({required this.supervisoresRepository});

  // general
  final _dbColumns = SupervisoresModel.dbColumns;
  get dbColumns => _dbColumns;

  final _aliasColumns = SupervisoresModel.aliasColumns;
  get aliasColumns => _aliasColumns;

  final gridColumns = supervisoresGridColumns();

  var _supervisoresModelList = <SupervisoresModel>[];

  final _supervisoresModel = SupervisoresModel().obs;
  SupervisoresModel get supervisoresModel => _supervisoresModel.value;
  set supervisoresModel(value) => _supervisoresModel.value = value ?? SupervisoresModel();

  final _filter = Filter().obs;
  Filter get filter => _filter.value;
  set filter(value) => _filter.value = value ?? Filter();

  var _isInserting = false;

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
    for (var supervisoresModel in _supervisoresModelList) {
      plutoRowList.add(_getPlutoRow(supervisoresModel));
    }
    return plutoRowList;
  }

  PlutoRow _getPlutoRow(SupervisoresModel supervisoresModel) {
    return PlutoRow(
      cells: _getPlutoCells(supervisoresModel: supervisoresModel),
    );
  }

  Map<String, PlutoCell> _getPlutoCells({SupervisoresModel? supervisoresModel}) {
    return {
      "supervisorid": PlutoCell(value: supervisoresModel?.supervisorid ?? 0),
      "nome": PlutoCell(value: supervisoresModel?.nome ?? ''),
      "cargo": PlutoCell(value: supervisoresModel?.cargo ?? ''),
      "email": PlutoCell(value: supervisoresModel?.email ?? ''),
      "telefone": PlutoCell(value: supervisoresModel?.telefone ?? ''),
      "dataadmissao": PlutoCell(value: supervisoresModel?.dataadmissao ?? ''),
      "status": PlutoCell(value: supervisoresModel?.status ?? ''),
    };
  }

  void plutoRowToObject() {
    final modelFromRow = _supervisoresModelList
        .where(((t) => t.supervisorid == plutoRow.cells['supervisorid']!.value))
        .toList();
    if (modelFromRow.isEmpty) {
      supervisoresModel.plutoRowToObject(plutoRow);
    } else {
      supervisoresModel = modelFromRow[0];
    }
  }

  Future callFilter() async {
    final filterController = Get.find<FilterController>();
    filterController.title = '${'filter_page_title'.tr} [Supervisores]';
    filterController.standardFilter = true;
    filterController.aliasColumns = aliasColumns;
    filterController.dbColumns = dbColumns;
    filterController.filter.field = 'Id';

    filter = await Get.toNamed(Routes.filterPage);
    await loadData();
  }

  Future loadData() async {
    _plutoGridStateManager.setShowLoading(true);
    _plutoGridStateManager.removeAllRows();
    await Get.find<SupervisoresController>().getList(filter: filter);
    _plutoGridStateManager.appendRows(plutoRows());
    _plutoGridStateManager.setShowLoading(false);
  }

  Future getList({Filter? filter}) async {
    await supervisoresRepository.getList(filter: filter).then((data) {
      _supervisoresModelList = data ?? [];
    });
  }

  void printReport() {
    Get.dialog(AlertDialog(
      content: ReportPage(
        title: 'Supervisores',
        columns: gridColumns.map((column) => column.title).toList(),
        plutoRows: plutoRows(),
      ),
    ));
  }

  void callEditPage() {
    final currentRow = _plutoGridStateManager.currentRow;
    if (currentRow != null) {
      nomeController.text = currentRow.cells['nome']?.value ?? '';
      cargoController.text = currentRow.cells['cargo']?.value ?? '';
      emailController.text = currentRow.cells['email']?.value ?? '';
      telefoneController.text = currentRow.cells['telefone']?.value ?? '';
      statusController.text = currentRow.cells['status']?.value ?? '';

      plutoRow = currentRow;
      formWasChanged = false;
      plutoRowToObject();
      Get.toNamed(Routes.supervisoresEditPage)!.then((value) {
        if (supervisoresModel.supervisorid == 0) {
          _plutoGridStateManager.removeCurrentRow();
        }
      });
    } else {
      showInfoSnackBar(message: 'message_select_one_to_edited'.tr);
    }
  }

  void callEditPageToInsert() {
    _plutoGridStateManager.prependNewRows();
    final cell = _plutoGridStateManager.rows.first.cells.entries.elementAt(0).value;
    _plutoGridStateManager.setCurrentCell(cell, 0);
    _isInserting = true;
    supervisoresModel = SupervisoresModel();
    callEditPage();
  }

  void handleKeyboard(PlutoKeyManagerEvent event) {
    if (event.isKeyDownEvent && event.event.logicalKey.keyId == LogicalKeyboardKey.enter.keyId) {
      if (canUpdate) {
        callEditPage();
      } else {
        noPrivilegeMessage();
      }
    }
  }

  Future delete() async {
    final currentRow = _plutoGridStateManager.currentRow;
    if (currentRow != null) {
      showDeleteDialog(() async {
        if (await supervisoresRepository.delete(
            supervisorid: currentRow.cells['supervisorid']!.value)) {
          _supervisoresModelList
              .removeWhere(((t) => t.supervisorid == currentRow.cells['supervisorid']!.value));
          _plutoGridStateManager.removeCurrentRow();
        } else {
          showErrorSnackBar(message: 'message_error_delete'.tr);
        }
      });
    } else {
      showInfoSnackBar(message: 'message_select_one_to_delete'.tr);
    }
  }

  // edit page
  final scrollController = ScrollController();
  final nomeController = TextEditingController();
  final cargoController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final statusController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  final _formWasChanged = false.obs;
  get formWasChanged => _formWasChanged.value;
  set formWasChanged(value) => _formWasChanged.value = value;

  void objectToPlutoRow() {
    plutoRow.cells['supervisorid']?.value = supervisoresModel.supervisorid;
    plutoRow.cells['nome']?.value = supervisoresModel.nome;
    plutoRow.cells['cargo']?.value = supervisoresModel.cargo;
    plutoRow.cells['email']?.value = supervisoresModel.email;
    plutoRow.cells['telefone']?.value = supervisoresModel.telefone;
    plutoRow.cells['dataadmissao']?.value = Util.formatDate(supervisoresModel.dataadmissao);
    plutoRow.cells['status']?.value = supervisoresModel.status;
  }

  Future<void> save() async {
    final FormState form = formKey.currentState!;
    if (!form.validate()) {
      showErrorSnackBar(message: 'validator_form_message'.tr);
    } else {
      if (formWasChanged) {
        final result = await supervisoresRepository.save(supervisoresModel: supervisoresModel);
        if (result != null) {
          supervisoresModel = result;
          if (_isInserting) {
            _supervisoresModelList.add(result);
            _isInserting = false;
          }
          objectToPlutoRow();
          Get.back();
        }
      } else {
        Get.back();
      }
    }
  }

  void preventDataLoss() {
    if (formWasChanged) {
      showQuestionDialog('message_data_loss'.tr, () => Get.back());
    } else {
      Get.back();
    }
  }

  // override
  @override
  void onInit() {
    bootstrapGridParameters(
      gutterSize: Constants.flutterBootstrapGutterSize,
    );
    functionName = "supervisores";
    setPrivilege();
    super.onInit();
  }

  @override
  void onClose() {
    nomeController.dispose();
    cargoController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    statusController.dispose();
    keyboardListener.cancel();
    scrollController.dispose();
    super.onClose();
  }
}
