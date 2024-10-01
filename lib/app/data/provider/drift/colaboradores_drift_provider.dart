import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/provider/provider_base.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';

class ColaboradoresDriftProvider extends ProviderBase {
  Future<Stream<List<Map<String, dynamic>>>> getFilteredStream() async {
    return Session.database.colaboradoresDao.getFilteredStream();
  }

  Future<Stream<List<Map<String, dynamic>>>> getConhecimentoTecnicoStream() async {
    return Session.database.colaboradoresDao.getConhecimentoTecnicoStream();
  }

  Future<Stream<List<Map<String, dynamic>>>> getCombinacaoIndicadorestream(
      int? idColaborador) async {
    return Session.database.colaboradoresDao.getCombinacaoIndicadorestream(idColaborador);
  }

  Future<List<ColaboradoresModel>?> getList({Filter? filter}) async {
    List<ColaboradoresGrouped> colaboradoresDriftList = [];

    try {
      if (filter != null && filter.field != null) {
        colaboradoresDriftList = await Session.database.colaboradoresDao
            .getGroupedList(field: filter.field, value: filter.value!);
      } else {
        colaboradoresDriftList = await Session.database.colaboradoresDao.getGroupedList();
      }
      if (colaboradoresDriftList.isNotEmpty) {
        return toListModel(colaboradoresDriftList);
      } else {
        return [];
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

  Future<ColaboradoresModel?> getObject(dynamic pk) async {
    try {
      final result = await Session.database.colaboradoresDao
          .getObjectGrouped(field: 'colaboradorid', value: pk);
      return toModel(result);
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
    }
    return null;
  }

  Future<ColaboradoresModel?>? insert(ColaboradoresModel colaboradoresModel) async {
    try {
      final lastPk =
          await Session.database.colaboradoresDao.insertObject(toDrift(colaboradoresModel));
      colaboradoresModel.colaboradorid = lastPk;
      return colaboradoresModel;
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
    }
    return null;
  }

  Future<ColaboradoresModel?>? update(ColaboradoresModel colaboradoresModel) async {
    try {
      await Session.database.colaboradoresDao.updateObject(toDrift(colaboradoresModel));
      return colaboradoresModel;
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
    }
    return null;
  }

  Future<bool?> delete(dynamic pk) async {
    try {
      await Session.database.colaboradoresDao
          .deleteObject(toDrift(ColaboradoresModel(colaboradorid: pk)));
      return true;
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
    }
    return null;
  }

  List<ColaboradoresModel> toListModel(List<ColaboradoresGrouped> colaboradoresDriftList) {
    List<ColaboradoresModel> listModel = [];
    for (var colaboradoresDrift in colaboradoresDriftList) {
      listModel.add(toModel(colaboradoresDrift)!);
    }
    return listModel;
  }

  ColaboradoresModel? toModel(ColaboradoresGrouped? colaboradoresDrift) {
    if (colaboradoresDrift != null) {
      return ColaboradoresModel(
        colaboradorid: colaboradoresDrift.colaboradores?.colaboradorid,
        nome: colaboradoresDrift.colaboradores?.nome,
        cargoatual: colaboradoresDrift.colaboradores?.cargoatual,
        dataadmissao: colaboradoresDrift.colaboradores?.dataadmissao,
        experienciaatual: colaboradoresDrift.colaboradores?.experienciaatual,
        telefone: colaboradoresDrift.colaboradores?.telefone,
        status: colaboradoresDrift.colaboradores?.status,
        conhecimentotecnicoModelList:
            conhecimentotecnicoDriftToModel(colaboradoresDrift.conhecimentotecnicoGroupedList),
        engajamentoproatividadeModelList: engajamentoproatividadeDriftToModel(
            colaboradoresDrift.engajamentoproatividadeGroupedList),
        capacidadecomunicacaoModelList:
            capacidadecomunicacaoDriftToModel(colaboradoresDrift.capacidadecomunicacaoGroupedList),
        resultadosatingidosModelList:
            resultadosatingidosDriftToModel(colaboradoresDrift.resultadosatingidosGroupedList),
        capacitacaotreinamentosModelList: capacitacaotreinamentosDriftToModel(
            colaboradoresDrift.capacitacaotreinamentosGroupedList),
        feedbacksupervisoresModelList:
            feedbacksupervisoresDriftToModel(colaboradoresDrift.feedbacksupervisoresGroupedList),
        resolucaoproblemasModelList:
            resolucaoproblemasDriftToModel(colaboradoresDrift.resolucaoproblemasGroupedList),
        assiduidadepontualidadeModelList: assiduidadepontualidadeDriftToModel(
            colaboradoresDrift.assiduidadepontualidadeGroupedList),
      );
    } else {
      return null;
    }
  }

  List<ConhecimentotecnicoModel> conhecimentotecnicoDriftToModel(
      List<ConhecimentotecnicoGrouped>? conhecimentotecnicoDriftList) {
    List<ConhecimentotecnicoModel> conhecimentotecnicoModelList = [];
    if (conhecimentotecnicoDriftList != null) {
      for (var conhecimentotecnicoGrouped in conhecimentotecnicoDriftList) {
        conhecimentotecnicoModelList.add(ConhecimentotecnicoModel(
          conhecimentoid: conhecimentotecnicoGrouped.conhecimentotecnico?.conhecimentoid,
          colaboradorid: conhecimentotecnicoGrouped.conhecimentotecnico?.colaboradorid,
          descricaoconhecimento:
              conhecimentotecnicoGrouped.conhecimentotecnico?.descricaoconhecimento,
          nivelconhecimento: conhecimentotecnicoGrouped.conhecimentotecnico?.nivelconhecimento,
          dataavaliacao: conhecimentotecnicoGrouped.conhecimentotecnico?.dataavaliacao,
        ));
      }
      return conhecimentotecnicoModelList;
    }
    return [];
  }

  List<EngajamentoproatividadeModel> engajamentoproatividadeDriftToModel(
      List<EngajamentoproatividadeGrouped>? engajamentoproatividadeDriftList) {
    List<EngajamentoproatividadeModel> engajamentoproatividadeModelList = [];
    if (engajamentoproatividadeDriftList != null) {
      for (var engajamentoproatividadeGrouped in engajamentoproatividadeDriftList) {
        engajamentoproatividadeModelList.add(EngajamentoproatividadeModel(
          engajamentoid: engajamentoproatividadeGrouped.engajamentoproatividade?.engajamentoid,
          colaboradorid: engajamentoproatividadeGrouped.engajamentoproatividade?.colaboradorid,
          pontuacaoengajamento:
              engajamentoproatividadeGrouped.engajamentoproatividade?.pontuacaoengajamento,
          dataavaliacao: engajamentoproatividadeGrouped.engajamentoproatividade?.dataavaliacao,
          propostasmelhoria:
              engajamentoproatividadeGrouped.engajamentoproatividade?.propostasmelhoria,
        ));
      }
      return engajamentoproatividadeModelList;
    }
    return [];
  }

  List<CapacidadecomunicacaoModel> capacidadecomunicacaoDriftToModel(
      List<CapacidadecomunicacaoGrouped>? capacidadecomunicacaoDriftList) {
    List<CapacidadecomunicacaoModel> capacidadecomunicacaoModelList = [];
    if (capacidadecomunicacaoDriftList != null) {
      for (var capacidadecomunicacaoGrouped in capacidadecomunicacaoDriftList) {
        capacidadecomunicacaoModelList.add(CapacidadecomunicacaoModel(
          comunicacaoid: capacidadecomunicacaoGrouped.capacidadecomunicacao?.comunicacaoid,
          colaboradorid: capacidadecomunicacaoGrouped.capacidadecomunicacao?.colaboradorid,
          avaliacaocomunicacao:
              capacidadecomunicacaoGrouped.capacidadecomunicacao?.avaliacaocomunicacao,
          feedbackcomunicacao:
              capacidadecomunicacaoGrouped.capacidadecomunicacao?.feedbackcomunicacao,
          dataavaliacao: capacidadecomunicacaoGrouped.capacidadecomunicacao?.dataavaliacao,
        ));
      }
      return capacidadecomunicacaoModelList;
    }
    return [];
  }

  List<ResultadosatingidosModel> resultadosatingidosDriftToModel(
      List<ResultadosatingidosGrouped>? resultadosatingidosDriftList) {
    List<ResultadosatingidosModel> resultadosatingidosModelList = [];
    if (resultadosatingidosDriftList != null) {
      for (var resultadosatingidosGrouped in resultadosatingidosDriftList) {
        resultadosatingidosModelList.add(ResultadosatingidosModel(
          resultadoid: resultadosatingidosGrouped.resultadosatingidos?.resultadoid,
          colaboradorid: resultadosatingidosGrouped.resultadosatingidos?.colaboradorid,
          metasatingidas: resultadosatingidosGrouped.resultadosatingidos?.metasatingidas,
          dataavaliacao: resultadosatingidosGrouped.resultadosatingidos?.dataavaliacao,
          pontuacaoprodutividade:
              resultadosatingidosGrouped.resultadosatingidos?.pontuacaoprodutividade,
          defeitosproduzidos: resultadosatingidosGrouped.resultadosatingidos?.defeitosproduzidos,
        ));
      }
      return resultadosatingidosModelList;
    }
    return [];
  }

  List<CapacitacaotreinamentosModel> capacitacaotreinamentosDriftToModel(
      List<CapacitacaotreinamentosGrouped>? capacitacaotreinamentosDriftList) {
    List<CapacitacaotreinamentosModel> capacitacaotreinamentosModelList = [];
    if (capacitacaotreinamentosDriftList != null) {
      for (var capacitacaotreinamentosGrouped in capacitacaotreinamentosDriftList) {
        capacitacaotreinamentosModelList.add(CapacitacaotreinamentosModel(
          treinamentoid: capacitacaotreinamentosGrouped.capacitacaotreinamentos?.treinamentoid,
          colaboradorid: capacitacaotreinamentosGrouped.capacitacaotreinamentos?.colaboradorid,
          nometreinamento: capacitacaotreinamentosGrouped.capacitacaotreinamentos?.nometreinamento,
          dataconclusao: capacitacaotreinamentosGrouped.capacitacaotreinamentos?.dataconclusao,
          certificado: capacitacaotreinamentosGrouped.capacitacaotreinamentos?.certificado,
        ));
      }
      return capacitacaotreinamentosModelList;
    }
    return [];
  }

  List<FeedbacksupervisoresModel> feedbacksupervisoresDriftToModel(
      List<FeedbacksupervisoresGrouped>? feedbacksupervisoresDriftList) {
    List<FeedbacksupervisoresModel> feedbacksupervisoresModelList = [];
    if (feedbacksupervisoresDriftList != null) {
      for (var feedbacksupervisoresGrouped in feedbacksupervisoresDriftList) {
        feedbacksupervisoresModelList.add(FeedbacksupervisoresModel(
          feedbackid: feedbacksupervisoresGrouped.feedbacksupervisores?.feedbackid,
          supervisoridSupervisores:
              feedbacksupervisoresGrouped.feedbacksupervisores?.supervisoridSupervisores,
          supervisoresModel: SupervisoresModel(
            supervisorid: feedbacksupervisoresGrouped.supervisores?.supervisorid,
            nome: feedbacksupervisoresGrouped.supervisores?.nome,
            cargo: feedbacksupervisoresGrouped.supervisores?.cargo,
            email: feedbacksupervisoresGrouped.supervisores?.email,
            telefone: feedbacksupervisoresGrouped.supervisores?.telefone,
            dataadmissao: feedbacksupervisoresGrouped.supervisores?.dataadmissao,
            status: feedbacksupervisoresGrouped.supervisores?.status,
          ),
          colaboradorid: feedbacksupervisoresGrouped.feedbacksupervisores?.colaboradorid,
          feedback: feedbacksupervisoresGrouped.feedbacksupervisores?.feedback,
          datafeedback: feedbacksupervisoresGrouped.feedbacksupervisores?.datafeedback,
        ));
      }
      return feedbacksupervisoresModelList;
    }
    return [];
  }

  List<ResolucaoproblemasModel> resolucaoproblemasDriftToModel(
      List<ResolucaoproblemasGrouped>? resolucaoproblemasDriftList) {
    List<ResolucaoproblemasModel> resolucaoproblemasModelList = [];
    if (resolucaoproblemasDriftList != null) {
      for (var resolucaoproblemasGrouped in resolucaoproblemasDriftList) {
        resolucaoproblemasModelList.add(ResolucaoproblemasModel(
          resolucaoid: resolucaoproblemasGrouped.resolucaoproblemas?.resolucaoid,
          colaboradorid: resolucaoproblemasGrouped.resolucaoproblemas?.colaboradorid,
          descricaoproblemaresolvido:
              resolucaoproblemasGrouped.resolucaoproblemas?.descricaoproblemaresolvido,
          dataresolucao: resolucaoproblemasGrouped.resolucaoproblemas?.dataresolucao,
          avaliacaoresolucao: resolucaoproblemasGrouped.resolucaoproblemas?.avaliacaoresolucao,
        ));
      }
      return resolucaoproblemasModelList;
    }
    return [];
  }

  List<AssiduidadepontualidadeModel> assiduidadepontualidadeDriftToModel(
      List<AssiduidadepontualidadeGrouped>? assiduidadepontualidadeDriftList) {
    List<AssiduidadepontualidadeModel> assiduidadepontualidadeModelList = [];
    if (assiduidadepontualidadeDriftList != null) {
      for (var assiduidadepontualidadeGrouped in assiduidadepontualidadeDriftList) {
        assiduidadepontualidadeModelList.add(AssiduidadepontualidadeModel(
          assiduidadeid: assiduidadepontualidadeGrouped.assiduidadepontualidade?.assiduidadeid,
          colaboradorid: assiduidadepontualidadeGrouped.assiduidadepontualidade?.colaboradorid,
          faltasinjustificadas:
              assiduidadepontualidadeGrouped.assiduidadepontualidade?.faltasinjustificadas,
          atrasos: assiduidadepontualidadeGrouped.assiduidadepontualidade?.atrasos,
          dataregistro: assiduidadepontualidadeGrouped.assiduidadepontualidade?.dataregistro,
        ));
      }
      return assiduidadepontualidadeModelList;
    }
    return [];
  }

  ColaboradoresGrouped toDrift(ColaboradoresModel colaboradoresModel) {
    return ColaboradoresGrouped(
      colaboradores: Colaboradores(
        colaboradorid: colaboradoresModel.colaboradorid,
        nome: colaboradoresModel.nome,
        cargoatual: colaboradoresModel.cargoatual,
        dataadmissao: colaboradoresModel.dataadmissao,
        experienciaatual: colaboradoresModel.experienciaatual,
        telefone: colaboradoresModel.telefone,
        status: colaboradoresModel.status,
      ),
      conhecimentotecnicoGroupedList:
          conhecimentotecnicoModelToDrift(colaboradoresModel.conhecimentotecnicoModelList),
      engajamentoproatividadeGroupedList:
          engajamentoproatividadeModelToDrift(colaboradoresModel.engajamentoproatividadeModelList),
      capacidadecomunicacaoGroupedList:
          capacidadecomunicacaoModelToDrift(colaboradoresModel.capacidadecomunicacaoModelList),
      resultadosatingidosGroupedList:
          resultadosatingidosModelToDrift(colaboradoresModel.resultadosatingidosModelList),
      capacitacaotreinamentosGroupedList:
          capacitacaotreinamentosModelToDrift(colaboradoresModel.capacitacaotreinamentosModelList),
      feedbacksupervisoresGroupedList:
          feedbacksupervisoresModelToDrift(colaboradoresModel.feedbacksupervisoresModelList),
      resolucaoproblemasGroupedList:
          resolucaoproblemasModelToDrift(colaboradoresModel.resolucaoproblemasModelList),
      assiduidadepontualidadeGroupedList:
          assiduidadepontualidadeModelToDrift(colaboradoresModel.assiduidadepontualidadeModelList),
    );
  }

  List<ConhecimentotecnicoGrouped> conhecimentotecnicoModelToDrift(
      List<ConhecimentotecnicoModel>? conhecimentotecnicoModelList) {
    List<ConhecimentotecnicoGrouped> conhecimentotecnicoGroupedList = [];
    if (conhecimentotecnicoModelList != null) {
      for (var conhecimentotecnicoModel in conhecimentotecnicoModelList) {
        conhecimentotecnicoGroupedList.add(
          ConhecimentotecnicoGrouped(
            conhecimentotecnico: Conhecimentotecnico(
              conhecimentoid: conhecimentotecnicoModel.conhecimentoid,
              colaboradorid: conhecimentotecnicoModel.colaboradorid,
              descricaoconhecimento: conhecimentotecnicoModel.descricaoconhecimento,
              nivelconhecimento: conhecimentotecnicoModel.nivelconhecimento,
              dataavaliacao: conhecimentotecnicoModel.dataavaliacao,
            ),
          ),
        );
      }
      return conhecimentotecnicoGroupedList;
    }
    return [];
  }

  List<EngajamentoproatividadeGrouped> engajamentoproatividadeModelToDrift(
      List<EngajamentoproatividadeModel>? engajamentoproatividadeModelList) {
    List<EngajamentoproatividadeGrouped> engajamentoproatividadeGroupedList = [];
    if (engajamentoproatividadeModelList != null) {
      for (var engajamentoproatividadeModel in engajamentoproatividadeModelList) {
        engajamentoproatividadeGroupedList.add(
          EngajamentoproatividadeGrouped(
            engajamentoproatividade: Engajamentoproatividade(
              engajamentoid: engajamentoproatividadeModel.engajamentoid,
              colaboradorid: engajamentoproatividadeModel.colaboradorid,
              pontuacaoengajamento: engajamentoproatividadeModel.pontuacaoengajamento,
              dataavaliacao: engajamentoproatividadeModel.dataavaliacao,
              propostasmelhoria: engajamentoproatividadeModel.propostasmelhoria,
            ),
          ),
        );
      }
      return engajamentoproatividadeGroupedList;
    }
    return [];
  }

  List<CapacidadecomunicacaoGrouped> capacidadecomunicacaoModelToDrift(
      List<CapacidadecomunicacaoModel>? capacidadecomunicacaoModelList) {
    List<CapacidadecomunicacaoGrouped> capacidadecomunicacaoGroupedList = [];
    if (capacidadecomunicacaoModelList != null) {
      for (var capacidadecomunicacaoModel in capacidadecomunicacaoModelList) {
        capacidadecomunicacaoGroupedList.add(
          CapacidadecomunicacaoGrouped(
            capacidadecomunicacao: Capacidadecomunicacao(
              comunicacaoid: capacidadecomunicacaoModel.comunicacaoid,
              colaboradorid: capacidadecomunicacaoModel.colaboradorid,
              avaliacaocomunicacao: capacidadecomunicacaoModel.avaliacaocomunicacao,
              feedbackcomunicacao: capacidadecomunicacaoModel.feedbackcomunicacao,
              dataavaliacao: capacidadecomunicacaoModel.dataavaliacao,
            ),
          ),
        );
      }
      return capacidadecomunicacaoGroupedList;
    }
    return [];
  }

  List<ResultadosatingidosGrouped> resultadosatingidosModelToDrift(
      List<ResultadosatingidosModel>? resultadosatingidosModelList) {
    List<ResultadosatingidosGrouped> resultadosatingidosGroupedList = [];
    if (resultadosatingidosModelList != null) {
      for (var resultadosatingidosModel in resultadosatingidosModelList) {
        resultadosatingidosGroupedList.add(
          ResultadosatingidosGrouped(
            resultadosatingidos: Resultadosatingidos(
              resultadoid: resultadosatingidosModel.resultadoid,
              colaboradorid: resultadosatingidosModel.colaboradorid,
              metasatingidas: resultadosatingidosModel.metasatingidas,
              dataavaliacao: resultadosatingidosModel.dataavaliacao,
              pontuacaoprodutividade: resultadosatingidosModel.pontuacaoprodutividade,
              defeitosproduzidos: resultadosatingidosModel.defeitosproduzidos,
            ),
          ),
        );
      }
      return resultadosatingidosGroupedList;
    }
    return [];
  }

  List<CapacitacaotreinamentosGrouped> capacitacaotreinamentosModelToDrift(
      List<CapacitacaotreinamentosModel>? capacitacaotreinamentosModelList) {
    List<CapacitacaotreinamentosGrouped> capacitacaotreinamentosGroupedList = [];
    if (capacitacaotreinamentosModelList != null) {
      for (var capacitacaotreinamentosModel in capacitacaotreinamentosModelList) {
        capacitacaotreinamentosGroupedList.add(
          CapacitacaotreinamentosGrouped(
            capacitacaotreinamentos: Capacitacaotreinamentos(
              treinamentoid: capacitacaotreinamentosModel.treinamentoid,
              colaboradorid: capacitacaotreinamentosModel.colaboradorid,
              nometreinamento: capacitacaotreinamentosModel.nometreinamento,
              dataconclusao: capacitacaotreinamentosModel.dataconclusao,
              certificado: capacitacaotreinamentosModel.certificado,
            ),
          ),
        );
      }
      return capacitacaotreinamentosGroupedList;
    }
    return [];
  }

  List<FeedbacksupervisoresGrouped> feedbacksupervisoresModelToDrift(
      List<FeedbacksupervisoresModel>? feedbacksupervisoresModelList) {
    List<FeedbacksupervisoresGrouped> feedbacksupervisoresGroupedList = [];
    if (feedbacksupervisoresModelList != null) {
      for (var feedbacksupervisoresModel in feedbacksupervisoresModelList) {
        feedbacksupervisoresGroupedList.add(
          FeedbacksupervisoresGrouped(
            feedbacksupervisores: Feedbacksupervisores(
              feedbackid: feedbacksupervisoresModel.feedbackid,
              supervisoridSupervisores: feedbacksupervisoresModel.supervisoridSupervisores,
              colaboradorid: feedbacksupervisoresModel.colaboradorid,
              feedback: feedbacksupervisoresModel.feedback,
              datafeedback: feedbacksupervisoresModel.datafeedback,
            ),
          ),
        );
      }
      return feedbacksupervisoresGroupedList;
    }
    return [];
  }

  List<ResolucaoproblemasGrouped> resolucaoproblemasModelToDrift(
      List<ResolucaoproblemasModel>? resolucaoproblemasModelList) {
    List<ResolucaoproblemasGrouped> resolucaoproblemasGroupedList = [];
    if (resolucaoproblemasModelList != null) {
      for (var resolucaoproblemasModel in resolucaoproblemasModelList) {
        resolucaoproblemasGroupedList.add(
          ResolucaoproblemasGrouped(
            resolucaoproblemas: Resolucaoproblemas(
              resolucaoid: resolucaoproblemasModel.resolucaoid,
              colaboradorid: resolucaoproblemasModel.colaboradorid,
              descricaoproblemaresolvido: resolucaoproblemasModel.descricaoproblemaresolvido,
              dataresolucao: resolucaoproblemasModel.dataresolucao,
              avaliacaoresolucao: resolucaoproblemasModel.avaliacaoresolucao,
            ),
          ),
        );
      }
      return resolucaoproblemasGroupedList;
    }
    return [];
  }

  List<AssiduidadepontualidadeGrouped> assiduidadepontualidadeModelToDrift(
      List<AssiduidadepontualidadeModel>? assiduidadepontualidadeModelList) {
    List<AssiduidadepontualidadeGrouped> assiduidadepontualidadeGroupedList = [];
    if (assiduidadepontualidadeModelList != null) {
      for (var assiduidadepontualidadeModel in assiduidadepontualidadeModelList) {
        assiduidadepontualidadeGroupedList.add(
          AssiduidadepontualidadeGrouped(
            assiduidadepontualidade: Assiduidadepontualidade(
              assiduidadeid: assiduidadepontualidadeModel.assiduidadeid,
              colaboradorid: assiduidadepontualidadeModel.colaboradorid,
              faltasinjustificadas: assiduidadepontualidadeModel.faltasinjustificadas,
              atrasos: assiduidadepontualidadeModel.atrasos,
              dataregistro: assiduidadepontualidadeModel.dataregistro,
            ),
          ),
        );
      }
      return assiduidadepontualidadeGroupedList;
    }
    return [];
  }
}
