import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/data/dto/dto.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/controller/controller_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:integre_plus_action_renault/app/page/grid_columns/grid_columns_imports.dart';
import 'package:integre_plus_action_renault/app/page/page_imports.dart';

import 'package:integre_plus_action_renault/app/routes/app_routes.dart';
import 'package:integre_plus_action_renault/app/data/repository/colaboradores_repository.dart';
import 'package:integre_plus_action_renault/app/page/shared_page/shared_page_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';
import 'package:integre_plus_action_renault/app/mixin/controller_base_mixin.dart';

class ColaboradoresController extends GetxController
    with GetSingleTickerProviderStateMixin, ControllerBaseMixin {
  final ColaboradoresRepository colaboradoresRepository;
  ColaboradoresController({required this.colaboradoresRepository});

  // general
  final _dbColumns = ColaboradoresModel.dbColumns;
  get dbColumns => _dbColumns;

  final _aliasColumns = ColaboradoresModel.aliasColumns;
  get aliasColumns => _aliasColumns;

  final gridColumns = colaboradoresGridColumns();

  var _colaboradoresModelList = <ColaboradoresModel>[];
  //final List<ColaboradoresModel> _colaboradoresModelList = [];
  List<ColaboradoresModel> get colaboradoresModelList => _colaboradoresModelList;

  var _colaboradoresModelOld = ColaboradoresModel();

  final _colaboradoresModel = ColaboradoresModel().obs;
  ColaboradoresModel get colaboradoresModel => _colaboradoresModel.value;
  set colaboradoresModel(value) => _colaboradoresModel.value = value ?? ColaboradoresModel();

  final List<PontuacaoProdutividadeColaboradorDto> _listPontuacaoColaborador = [];
  List<PontuacaoProdutividadeColaboradorDto> get pontuacaoColaboradorStream =>
      _listPontuacaoColaborador;

  final List<ConhecimentoTecnicoDto> _listConhecimentoTecnico = [];
  List<ConhecimentoTecnicoDto> get conhecimentoTecnicoStream => _listConhecimentoTecnico;

  final _pontuacaoGeral = PontuacaoGeralDto().obs;
  PontuacaoGeralDto get pontuacaoGeralStream => _pontuacaoGeral.value;
  set pontuacaoGeralStream(value) => _pontuacaoGeral.value = value ?? PontuacaoGeralDto();

  final _filter = Filter().obs;
  Filter get filter => _filter.value;
  set filter(value) => _filter.value = value ?? Filter();

  final RxDouble _mediaGeral = 0.0.obs;
  double get mediaGeral => _mediaGeral.value;
  set mediaGeral(value) => _mediaGeral.value = value ?? double;

  var _isInserting = false;

  // tab page
  late TabController tabController;

  List<Tab> tabItems = [
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Colaboradores',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Conhecimentotecnico',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Engajamentoproatividade',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Capacidadecomunicacao',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Resultadosatingidos',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Capacitacaotreinamentos',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Feedback supervisor',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Resolucaoproblemas',
    ),
    Tab(
      icon: Icon(iconDataList[Random().nextInt(10)]),
      text: 'Assiduidadepontualidade',
    ),
  ];

  List<Widget> tabPages() {
    return [
      ColaboradoresEditPage(),
      const ConhecimentotecnicoListPage(),
      const EngajamentoproatividadeListPage(),
      const CapacidadecomunicacaoListPage(),
      const ResultadosatingidosListPage(),
      const CapacitacaotreinamentosListPage(),
      const FeedbacksupervisoresListPage(),
      const ResolucaoproblemasListPage(),
      const AssiduidadepontualidadeListPage(),
    ];
  }

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
    for (var colaboradoresModel in _colaboradoresModelList) {
      plutoRowList.add(_getPlutoRow(colaboradoresModel));
    }
    return plutoRowList;
  }

  PlutoRow _getPlutoRow(ColaboradoresModel colaboradoresModel) {
    return PlutoRow(
      cells: _getPlutoCells(colaboradoresModel: colaboradoresModel),
    );
  }

  Map<String, PlutoCell> _getPlutoCells({ColaboradoresModel? colaboradoresModel}) {
    return {
      "colaboradorid": PlutoCell(value: colaboradoresModel?.colaboradorid ?? 0),
      "nome": PlutoCell(value: colaboradoresModel?.nome ?? ''),
      "cargoatual": PlutoCell(value: colaboradoresModel?.cargoatual ?? ''),
      "dataadmissao": PlutoCell(value: colaboradoresModel?.dataadmissao ?? ''),
      "experienciaatual": PlutoCell(value: colaboradoresModel?.experienciaatual ?? 0),
      "telefone": PlutoCell(value: colaboradoresModel?.telefone ?? ''),
      "status": PlutoCell(value: colaboradoresModel?.status ?? ''),
    };
  }

  void plutoRowToObject() {
    final modelFromRow = _colaboradoresModelList
        .where(((t) => t.colaboradorid == plutoRow.cells['colaboradorid']!.value))
        .toList();
    if (modelFromRow.isEmpty) {
      colaboradoresModel.plutoRowToObject(plutoRow);
    } else {
      colaboradoresModel = modelFromRow[0];
      _colaboradoresModelOld = colaboradoresModel.clone();
    }
  }

  Future callFilter() async {
    final filterController = Get.find<FilterController>();
    filterController.title = '${'filter_page_title'.tr} [Colaboradores]';
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
    await Get.find<ColaboradoresController>().getList(filter: filter);
    _plutoGridStateManager.appendRows(plutoRows());
    _plutoGridStateManager.setShowLoading(false);
  }

  Future getList({Filter? filter}) async {
    await colaboradoresRepository.getList(filter: filter).then((data) {
      _colaboradoresModelList = data ?? [];
    });
  }

  Future<void> getPontuacaoProdutividadeStream() async {
    int index = 0;
    await colaboradoresRepository.getFilteredStream().then((data) {
      data.listen((onData) {
        for (Map<String, dynamic> map in onData) {
          var cola = PontuacaoProdutividadeColaboradorDto(
            index: index,
            nome: map['nomeColaborador'],
            pontuacaoProdutividade: map['pontuacaoProdutividade'],
            pontuacaoEngajamento: map['pontuacaoEngajamento'],
            avaliacaoComunicacao: map['avaliacaoComunicacao'],
          );
          _listPontuacaoColaborador.add(cola);
          index++;
        }
      });
    });
  }

  Future<void> getConhecimentoTecnicoStream() async {
    int index = 0;
    await colaboradoresRepository.getConhecimentoTecnicoStream().then((data) {
      data.listen((onData) {
        for (Map<String, dynamic> map in onData) {
          var cola = ConhecimentoTecnicoDto(
            index: index,
            nivelConhecimento: map['nivelConhecimento'],
            totalColaboradorPorNivel: map['totalColaboradorPorNivel'],
            mediaNivelConhecimento: map['mediaNivelConhecimento'],
            percentualColaborador: map['percentualColaborador'],
          );
          _listConhecimentoTecnico.add(cola);
          index++;
        }
      });
    });
  }

  Future<void> getCombinacaoIndicadorestream(int? idColaborador) async {
    int index = 0;
    await colaboradoresRepository.getCombinacaoIndicadorestream(idColaborador).then((data) {
      data.listen((onData) {
        for (Map<String, dynamic> map in onData) {
          var cola = PontuacaoGeralDto(
            index: index,
            percentualTreinamento: map['percentualTreinamento'],
            totalProblemaResolvido: map['totalProblemaResolvido'],
            mediaNivelConhecimento: map['mediaNivelConhecimento'],
            mediaEngajamento: map['mediaEngajamento'],
            mediaComunicacao: map['mediaComunicacao'],
            mediaMetaAtingida: map['mediaMetaAtingida'],
            mediaProdutividade: map['mediaProdutividade'],
            mediaAvaliacaoQualitativa: map['mediaAvaliacaoQualitativa'],
            mediaAvaliacaoResolucao: map['mediaAvaliacaoResolucao'],
            mediaFaltaInjustificada: map['mediaFaltaInjustificada'],
            mediaAtraso: map['mediaAtraso'],
          );
          pontuacaoGeralStream = cola;
          index++;
        }
        update();
      });
    });
  }

  Future<void> getMediaGeralStream(int? idColaborador) async {
    await colaboradoresRepository.getMediaGeralStream(idColaborador).then((data) {
      data.listen((onData) {
        mediaGeral = onData['mediaGeral'];
        update();
      });
    });
  }

  void printReport() {
    Get.dialog(AlertDialog(
      content: ReportPage(
        title: 'Colaboradores',
        columns: gridColumns.map((column) => column.title).toList(),
        plutoRows: plutoRows(),
      ),
    ));
  }

  void callEditPage() {
    final currentRow = _plutoGridStateManager.currentRow;
    if (currentRow != null) {
      nomeController.text = currentRow.cells['nome']?.value ?? '';
      cargoatualController.text = currentRow.cells['cargoatual']?.value ?? '';
      experienciaatualController.text =
          currentRow.cells['experienciaatual']?.value?.toString() ?? '';
      telefoneController.text = currentRow.cells['telefone']?.value ?? '';
      statusController.text = currentRow.cells['status']?.value ?? '';
      plutoRow = currentRow;
      formWasChanged = false;
      plutoRowToObject();

      tabController.animateTo(0);

      //Conhecimentotecnico
      Get.put<ConhecimentotecnicoController>(ConhecimentotecnicoController());
      final conhecimentotecnicoController = Get.find<ConhecimentotecnicoController>();
      conhecimentotecnicoController.conhecimentotecnicoModelList =
          colaboradoresModel.conhecimentotecnicoModelList!;
      conhecimentotecnicoController.userMadeChanges = false;

      //Engajamentoproatividade
      Get.put<EngajamentoproatividadeController>(EngajamentoproatividadeController());
      final engajamentoproatividadeController = Get.find<EngajamentoproatividadeController>();
      engajamentoproatividadeController.engajamentoproatividadeModelList =
          colaboradoresModel.engajamentoproatividadeModelList!;
      engajamentoproatividadeController.userMadeChanges = false;

      //Capacidadecomunicacao
      Get.put<CapacidadecomunicacaoController>(CapacidadecomunicacaoController());
      final capacidadecomunicacaoController = Get.find<CapacidadecomunicacaoController>();
      capacidadecomunicacaoController.capacidadecomunicacaoModelList =
          colaboradoresModel.capacidadecomunicacaoModelList!;
      capacidadecomunicacaoController.userMadeChanges = false;

      //Resultadosatingidos
      Get.put<ResultadosatingidosController>(ResultadosatingidosController());
      final resultadosatingidosController = Get.find<ResultadosatingidosController>();
      resultadosatingidosController.resultadosatingidosModelList =
          colaboradoresModel.resultadosatingidosModelList!;
      resultadosatingidosController.userMadeChanges = false;

      //Capacitacaotreinamentos
      Get.put<CapacitacaotreinamentosController>(CapacitacaotreinamentosController());
      final capacitacaotreinamentosController = Get.find<CapacitacaotreinamentosController>();
      capacitacaotreinamentosController.capacitacaotreinamentosModelList =
          colaboradoresModel.capacitacaotreinamentosModelList!;
      capacitacaotreinamentosController.userMadeChanges = false;

      //Feedback supervisor
      Get.put<FeedbacksupervisoresController>(FeedbacksupervisoresController());
      final feedbacksupervisoresController = Get.find<FeedbacksupervisoresController>();
      feedbacksupervisoresController.feedbacksupervisoresModelList =
          colaboradoresModel.feedbacksupervisoresModelList!;
      feedbacksupervisoresController.userMadeChanges = false;

      //Resolucaoproblemas
      Get.put<ResolucaoproblemasController>(ResolucaoproblemasController());
      final resolucaoproblemasController = Get.find<ResolucaoproblemasController>();
      resolucaoproblemasController.resolucaoproblemasModelList =
          colaboradoresModel.resolucaoproblemasModelList!;
      resolucaoproblemasController.userMadeChanges = false;

      //Assiduidadepontualidade
      Get.put<AssiduidadepontualidadeController>(AssiduidadepontualidadeController());
      final assiduidadepontualidadeController = Get.find<AssiduidadepontualidadeController>();
      assiduidadepontualidadeController.assiduidadepontualidadeModelList =
          colaboradoresModel.assiduidadepontualidadeModelList!;
      assiduidadepontualidadeController.userMadeChanges = false;

      Get.toNamed(Routes.colaboradoresTabPage)!.then((value) {
        if (colaboradoresModel.colaboradorid == 0) {
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
    colaboradoresModel = ColaboradoresModel();
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
        if (await colaboradoresRepository.delete(
            colaboradorid: currentRow.cells['colaboradorid']!.value)) {
          _colaboradoresModelList
              .removeWhere(((t) => t.colaboradorid == currentRow.cells['colaboradorid']!.value));
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
  String? mandatoryMessage;

  final scrollController = ScrollController();
  final nomeController = TextEditingController();
  final cargoatualController = TextEditingController();
  final experienciaatualController = TextEditingController();
  final telefoneController = TextEditingController();
  final statusController = TextEditingController();

  final colaboradoresTabPageScaffoldKey = GlobalKey<ScaffoldState>();

  final colaboradoresEditPageScaffoldKey = GlobalKey<ScaffoldState>();
  final colaboradoresEditPageFormKey = GlobalKey<FormState>();

  final _formWasChanged = false.obs;
  get formWasChanged => _formWasChanged.value;
  set formWasChanged(value) => _formWasChanged.value = value;

  void objectToPlutoRow() {
    plutoRow.cells['colaboradorid']?.value = colaboradoresModel.colaboradorid;
    plutoRow.cells['nome']?.value = colaboradoresModel.nome;
    plutoRow.cells['cargoatual']?.value = colaboradoresModel.cargoatual;
    plutoRow.cells['dataadmissao']?.value = Util.formatDate(colaboradoresModel.dataadmissao);
    plutoRow.cells['experienciaatual']?.value = colaboradoresModel.experienciaatual;
    plutoRow.cells['telefone']?.value = colaboradoresModel.telefone;
    plutoRow.cells['status']?.value = colaboradoresModel.status;
  }

  Future<void> save() async {
    if (validateForms()) {
      if (userMadeChanges()) {
        final result = await colaboradoresRepository.save(colaboradoresModel: colaboradoresModel);
        if (result != null) {
          colaboradoresModel = result;
          if (_isInserting) {
            _colaboradoresModelList.add(colaboradoresModel);
            _isInserting = false;
          } else {
            _colaboradoresModelList
                .removeWhere(((t) => t.colaboradorid == plutoRow.cells['colaboradorid']!.value));
            _colaboradoresModelList.add(colaboradoresModel);
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
    if (userMadeChanges()) {
      showQuestionDialog('message_data_loss'.tr, () {
        clearUserChanges();
        Get.back();
      });
    } else {
      clearUserChanges();
      Get.back();
    }
  }

  bool userMadeChanges() {
    return formWasChanged ||
        Get.find<ConhecimentotecnicoController>().userMadeChanges ||
        Get.find<EngajamentoproatividadeController>().userMadeChanges ||
        Get.find<CapacidadecomunicacaoController>().userMadeChanges ||
        Get.find<ResultadosatingidosController>().userMadeChanges ||
        Get.find<CapacitacaotreinamentosController>().userMadeChanges ||
        Get.find<FeedbacksupervisoresController>().userMadeChanges ||
        Get.find<ResolucaoproblemasController>().userMadeChanges ||
        Get.find<AssiduidadepontualidadeController>().userMadeChanges;
  }

  void clearUserChanges() {
    _colaboradoresModelList
        .removeWhere(((t) => t.colaboradorid == plutoRow.cells['colaboradorid']!.value));
    _colaboradoresModelList.add(_colaboradoresModelOld);
  }

  void tabChange(int index) {
    validateForms();
  }

  bool validateForms() {
    mandatoryMessage = ValidateFormField.validateMandatory(colaboradoresModel.nome);
    if (mandatoryMessage != null) {
      tabController.animateTo(0);
      showErrorSnackBar(message: '$mandatoryMessage [Nome]');
      return false;
    }
    return true;
  }

  // override
  @override
  void onInit() {
    bootstrapGridParameters(
      gutterSize: Constants.flutterBootstrapGutterSize,
    );
    tabController = TabController(vsync: this, length: tabItems.length);
    functionName = "colaboradores";
    setPrivilege();
    super.onInit();
  }

  @override
  void onClose() {
    keyboardListener.cancel();
    scrollController.dispose();
    tabController.dispose();
    nomeController.dispose();
    cargoatualController.dispose();
    experienciaatualController.dispose();
    telefoneController.dispose();
    statusController.dispose();
    super.onClose();
  }
}
