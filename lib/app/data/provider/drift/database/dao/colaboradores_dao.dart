import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';

part 'colaboradores_dao.g.dart';

@DriftAccessor(tables: [
  Colaboradoress,
  Conhecimentotecnicos,
  Engajamentoproatividades,
  Capacidadecomunicacaos,
  Resultadosatingidoss,
  Capacitacaotreinamentoss,
  Feedbacksupervisoress,
  Supervisoress,
  Resolucaoproblemass,
  Assiduidadepontualidades,
])
class ColaboradoresDao extends DatabaseAccessor<AppDatabase> with _$ColaboradoresDaoMixin {
  final AppDatabase db;

  List<Colaboradores> colaboradoresList = [];
  List<ColaboradoresGrouped> colaboradoresGroupedList = [];

  ColaboradoresDao(this.db) : super(db);

  Stream<List<Map<String, dynamic>>> getFilteredStream() {
    return customSelect(
      "SELECT C.Nome as 'nomeColaborador', (R.PontuacaoProdutividade * 1.0) as 'pontuacaoProdutividade', "
      "(EP.PontuacaoEngajamento * 1.0) as 'pontuacaoEngajamento', (CC.AvaliacaoComunicacao * 1.0) as 'avaliacaoComunicacao' "
      "FROM Colaboradores C "
      "JOIN ResultadosAtingidos R ON C.ColaboradorID = R.ColaboradorID "
      "JOIN EngajamentoProatividade EP ON C.ColaboradorID = EP.ColaboradorID "
      "JOIN CapacidadeComunicacao CC ON C.ColaboradorID = CC.ColaboradorID "
      "WHERE R.PontuacaoProdutividade > 80 "
      "AND EP.PontuacaoEngajamento > 70 "
      "AND CC.AvaliacaoComunicacao > 8",
      readsFrom: {
        colaboradoress,
        resultadosatingidoss,
        engajamentoproatividades,
        capacidadecomunicacaos
      },
    ).watch().map((rows) {
      return rows.map((row) => row.data).toList();
    });
  }

  Stream<List<Map<String, dynamic>>> getConhecimentoTecnicoStream() {
    return customSelect(
      "WITH totalColaboradores AS ( "
      "SELECT COUNT(DISTINCT ColaboradorID) AS Total FROM ConhecimentoTecnico ) "
      "SELECT "
      "NivelConhecimento as nivelConhecimento, "
      "COUNT(ColaboradorID) AS totalColaboradorPorNivel, "
      "(COUNT(ColaboradorID) * 100.0 / (SELECT Total FROM TotalColaboradores)) AS percentualColaborador, "
      "AVG(CASE "
      "WHEN NivelConhecimento = 'Básico' THEN 1 "
      "WHEN NivelConhecimento = 'Intermediário' THEN 2 "
      "WHEN NivelConhecimento = 'Avançado' THEN 3 "
      "ELSE 0 "
      "END) AS mediaNivelConhecimento "
      "FROM ConhecimentoTecnico "
      "GROUP BY NivelConhecimento;",
      readsFrom: {
        conhecimentotecnicos,
      },
    ).watch().map((rows) {
      return rows.map((row) => row.data).toList();
    });
  }

  Stream<List<Map<String, dynamic>>> getCombinacaoIndicadorestream(int idColaborador) {
    return customSelect(
      "SELECT "
      "(SELECT AVG(CASE "
      "WHEN NivelConhecimento = 'Básico' THEN 1 "
      "WHEN NivelConhecimento = 'Intermediário' THEN 2 "
      "WHEN NivelConhecimento = 'Avançado' THEN 3 "
      "ELSE 0 "
      "END) "
      "FROM ConhecimentoTecnico where colaboradorid = $idColaborador) AS mediaNivelConhecimento, "
      "(SELECT AVG(PontuacaoEngajamento) "
      "FROM EngajamentoProatividade where colaboradorid = $idColaborador) AS mediaEngajamento, "
      "(SELECT AVG(AvaliacaoComunicacao) "
      "FROM CapacidadeComunicacao where colaboradorid = $idColaborador) AS mediaComunicacao, "
      "(SELECT AVG(MetasAtingidas) "
      "FROM ResultadosAtingidos where colaboradorid = $idColaborador) AS mediaMetasAtingidas, "
      "(SELECT AVG(PontuacaoProdutividade) "
      "FROM ResultadosAtingidos where colaboradorid = $idColaborador) AS mediaProdutividade, "
      "(SELECT (COUNT(DISTINCT ColaboradorID) / (SELECT COUNT(*) FROM Colaboradores)) * 100 "
      "FROM CapacitacaoTreinamentos where colaboradorid = $idColaborador) AS PercentualTreinados, "
      "(SELECT AVG(LENGTH(Feedback)) "
      "FROM FeedbackSupervisores where colaboradorid = $idColaborador) AS mediaAvaliacaoQualitativa, "
      "(SELECT COUNT(ResolucaoID) "
      "FROM ResolucaoProblemas where colaboradorid = $idColaborador) AS totalProblemasResolvidos, "
      "(SELECT AVG(AvaliacaoResolucao) "
      "FROM ResolucaoProblemas where colaboradorid = $idColaborador) AS mediaAvaliacaoResolucao, "
      "(SELECT AVG(FaltasInjustificadas) "
      "FROM AssiduidadePontualidade where colaboradorid = $idColaborador) AS mediaFaltasInjustificadas, "
      "(SELECT AVG(Atrasos) "
      "FROM AssiduidadePontualidade where colaboradorid = $idColaborador) AS mediaAtrasos;",
    ).watch().map((rows) {
      return rows.map((row) => row.data).toList();
    });
  }

  Future<List<Colaboradores>> getList() async {
    colaboradoresList = await select(colaboradoress).get();
    return colaboradoresList;
  }

  Future<List<Colaboradores>> getListFilter(String field, String value) async {
    final query = " $field like '%$value%'";
    final expression = CustomExpression<bool>(query);
    colaboradoresList = await (select(colaboradoress)..where((t) => expression)).get();
    return colaboradoresList;
  }

  Future<List<ColaboradoresGrouped>> getGroupedList({String? field, dynamic value}) async {
    final query = select(colaboradoress).join([]);

    if (field != null && field != '') {
      final column = colaboradoress.$columns.where(((column) => column.$name == field)).first;
      if (column is TextColumn) {
        query.where((column as TextColumn).like('%$value%'));
      } else if (column is IntColumn) {
        query.where(column.equals(int.tryParse(value) as Object));
      } else if (column is RealColumn) {
        query.where(column.equals(double.tryParse(value) as Object));
      }
    }

    colaboradoresGroupedList = await query.map((row) {
      final colaboradores = row.readTableOrNull(colaboradoress);

      return ColaboradoresGrouped(
        colaboradores: colaboradores,
      );
    }).get();

    // fill internal lists
    dynamic expression;
    for (var colaboradoresGrouped in colaboradoresGroupedList) {
      colaboradoresGrouped.conhecimentotecnicoGroupedList = [];
      final queryConhecimentotecnico =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryConhecimentotecnico);
      final conhecimentotecnicoList =
          await (select(conhecimentotecnicos)..where((t) => expression)).get();
      for (var conhecimentotecnico in conhecimentotecnicoList) {
        ConhecimentotecnicoGrouped conhecimentotecnicoGrouped = ConhecimentotecnicoGrouped(
          conhecimentotecnico: conhecimentotecnico,
        );
        colaboradoresGrouped.conhecimentotecnicoGroupedList!.add(conhecimentotecnicoGrouped);
      }

      colaboradoresGrouped.engajamentoproatividadeGroupedList = [];
      final queryEngajamentoproatividade =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryEngajamentoproatividade);
      final engajamentoproatividadeList =
          await (select(engajamentoproatividades)..where((t) => expression)).get();
      for (var engajamentoproatividade in engajamentoproatividadeList) {
        EngajamentoproatividadeGrouped engajamentoproatividadeGrouped =
            EngajamentoproatividadeGrouped(
          engajamentoproatividade: engajamentoproatividade,
        );
        colaboradoresGrouped.engajamentoproatividadeGroupedList!
            .add(engajamentoproatividadeGrouped);
      }

      colaboradoresGrouped.capacidadecomunicacaoGroupedList = [];
      final queryCapacidadecomunicacao =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryCapacidadecomunicacao);
      final capacidadecomunicacaoList =
          await (select(capacidadecomunicacaos)..where((t) => expression)).get();
      for (var capacidadecomunicacao in capacidadecomunicacaoList) {
        CapacidadecomunicacaoGrouped capacidadecomunicacaoGrouped = CapacidadecomunicacaoGrouped(
          capacidadecomunicacao: capacidadecomunicacao,
        );
        colaboradoresGrouped.capacidadecomunicacaoGroupedList!.add(capacidadecomunicacaoGrouped);
      }

      colaboradoresGrouped.resultadosatingidosGroupedList = [];
      final queryResultadosatingidos =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryResultadosatingidos);
      final resultadosatingidosList =
          await (select(resultadosatingidoss)..where((t) => expression)).get();
      for (var resultadosatingidos in resultadosatingidosList) {
        ResultadosatingidosGrouped resultadosatingidosGrouped = ResultadosatingidosGrouped(
          resultadosatingidos: resultadosatingidos,
        );
        colaboradoresGrouped.resultadosatingidosGroupedList!.add(resultadosatingidosGrouped);
      }

      colaboradoresGrouped.capacitacaotreinamentosGroupedList = [];
      final queryCapacitacaotreinamentos =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryCapacitacaotreinamentos);
      final capacitacaotreinamentosList =
          await (select(capacitacaotreinamentoss)..where((t) => expression)).get();
      for (var capacitacaotreinamentos in capacitacaotreinamentosList) {
        CapacitacaotreinamentosGrouped capacitacaotreinamentosGrouped =
            CapacitacaotreinamentosGrouped(
          capacitacaotreinamentos: capacitacaotreinamentos,
        );
        colaboradoresGrouped.capacitacaotreinamentosGroupedList!
            .add(capacitacaotreinamentosGrouped);
      }

      colaboradoresGrouped.feedbacksupervisoresGroupedList = [];
      final queryFeedbacksupervisores =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryFeedbacksupervisores);
      final feedbacksupervisoresList =
          await (select(feedbacksupervisoress)..where((t) => expression)).get();
      for (var feedbacksupervisores in feedbacksupervisoresList) {
        FeedbacksupervisoresGrouped feedbacksupervisoresGrouped = FeedbacksupervisoresGrouped(
          feedbacksupervisores: feedbacksupervisores,
          supervisores: await (select(supervisoress)
                ..where(
                    (t) => t.supervisorid.equals(feedbacksupervisores.supervisoridSupervisores!)))
              .getSingleOrNull(),
        );
        colaboradoresGrouped.feedbacksupervisoresGroupedList!.add(feedbacksupervisoresGrouped);
      }

      colaboradoresGrouped.resolucaoproblemasGroupedList = [];
      final queryResolucaoproblemas =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryResolucaoproblemas);
      final resolucaoproblemasList =
          await (select(resolucaoproblemass)..where((t) => expression)).get();
      for (var resolucaoproblemas in resolucaoproblemasList) {
        ResolucaoproblemasGrouped resolucaoproblemasGrouped = ResolucaoproblemasGrouped(
          resolucaoproblemas: resolucaoproblemas,
        );
        colaboradoresGrouped.resolucaoproblemasGroupedList!.add(resolucaoproblemasGrouped);
      }

      colaboradoresGrouped.assiduidadepontualidadeGroupedList = [];
      final queryAssiduidadepontualidade =
          ' colaboradorid = ${colaboradoresGrouped.colaboradores!.colaboradorid}';
      expression = CustomExpression<bool>(queryAssiduidadepontualidade);
      final assiduidadepontualidadeList =
          await (select(assiduidadepontualidades)..where((t) => expression)).get();
      for (var assiduidadepontualidade in assiduidadepontualidadeList) {
        AssiduidadepontualidadeGrouped assiduidadepontualidadeGrouped =
            AssiduidadepontualidadeGrouped(
          assiduidadepontualidade: assiduidadepontualidade,
        );
        colaboradoresGrouped.assiduidadepontualidadeGroupedList!
            .add(assiduidadepontualidadeGrouped);
      }
    }

    return colaboradoresGroupedList;
  }

  Future<Colaboradores?> getObject(dynamic pk) async {
    return await (select(colaboradoress)..where((t) => t.colaboradorid.equals(pk)))
        .getSingleOrNull();
  }

  Future<Colaboradores?> getObjectFilter(String field, String value) async {
    final query = "SELECT * FROM colaboradores WHERE $field like '%$value%'";
    return (await customSelect(query).getSingleOrNull()) as Colaboradores;
  }

  Future<ColaboradoresGrouped?> getObjectGrouped({String? field, dynamic value}) async {
    final result = await getGroupedList(field: field, value: value);

    if (result.length != 1) {
      return null;
    } else {
      return result[0];
    }
  }

  Future<int> insertObject(ColaboradoresGrouped object) {
    return transaction(() async {
      final maxPk = await lastPk();
      object.colaboradores = object.colaboradores!.copyWith(colaboradorid: Value(maxPk + 1));
      final pkInserted = await into(colaboradoress).insert(object.colaboradores!);
      object.colaboradores = object.colaboradores!.copyWith(colaboradorid: Value(pkInserted));
      await insertChildren(object);
      return pkInserted;
    });
  }

  Future<bool> updateObject(ColaboradoresGrouped object) {
    return transaction(() async {
      await deleteChildren(object);
      await insertChildren(object);
      return update(colaboradoress).replace(object.colaboradores!);
    });
  }

  Future<int> deleteObject(ColaboradoresGrouped object) {
    return transaction(() async {
      await deleteChildren(object);
      return delete(colaboradoress).delete(object.colaboradores!);
    });
  }

  Future<void> insertChildren(ColaboradoresGrouped object) async {
    for (var conhecimentotecnicoGrouped in object.conhecimentotecnicoGroupedList!) {
      conhecimentotecnicoGrouped.conhecimentotecnico =
          conhecimentotecnicoGrouped.conhecimentotecnico?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(conhecimentotecnicos).insert(conhecimentotecnicoGrouped.conhecimentotecnico!);
    }
    for (var engajamentoproatividadeGrouped in object.engajamentoproatividadeGroupedList!) {
      engajamentoproatividadeGrouped.engajamentoproatividade =
          engajamentoproatividadeGrouped.engajamentoproatividade?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(engajamentoproatividades)
          .insert(engajamentoproatividadeGrouped.engajamentoproatividade!);
    }
    for (var capacidadecomunicacaoGrouped in object.capacidadecomunicacaoGroupedList!) {
      capacidadecomunicacaoGrouped.capacidadecomunicacao =
          capacidadecomunicacaoGrouped.capacidadecomunicacao?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(capacidadecomunicacaos)
          .insert(capacidadecomunicacaoGrouped.capacidadecomunicacao!);
    }
    for (var resultadosatingidosGrouped in object.resultadosatingidosGroupedList!) {
      resultadosatingidosGrouped.resultadosatingidos =
          resultadosatingidosGrouped.resultadosatingidos?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(resultadosatingidoss).insert(resultadosatingidosGrouped.resultadosatingidos!);
    }
    for (var capacitacaotreinamentosGrouped in object.capacitacaotreinamentosGroupedList!) {
      capacitacaotreinamentosGrouped.capacitacaotreinamentos =
          capacitacaotreinamentosGrouped.capacitacaotreinamentos?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(capacitacaotreinamentoss)
          .insert(capacitacaotreinamentosGrouped.capacitacaotreinamentos!);
    }
    for (var feedbacksupervisoresGrouped in object.feedbacksupervisoresGroupedList!) {
      feedbacksupervisoresGrouped.feedbacksupervisores =
          feedbacksupervisoresGrouped.feedbacksupervisores?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(feedbacksupervisoress).insert(feedbacksupervisoresGrouped.feedbacksupervisores!);
    }
    for (var resolucaoproblemasGrouped in object.resolucaoproblemasGroupedList!) {
      resolucaoproblemasGrouped.resolucaoproblemas =
          resolucaoproblemasGrouped.resolucaoproblemas?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(resolucaoproblemass).insert(resolucaoproblemasGrouped.resolucaoproblemas!);
    }
    for (var assiduidadepontualidadeGrouped in object.assiduidadepontualidadeGroupedList!) {
      assiduidadepontualidadeGrouped.assiduidadepontualidade =
          assiduidadepontualidadeGrouped.assiduidadepontualidade?.copyWith(
        colaboradorid: Value(object.colaboradores!.colaboradorid),
      );
      await into(assiduidadepontualidades)
          .insert(assiduidadepontualidadeGrouped.assiduidadepontualidade!);
    }
  }

  Future<void> deleteChildren(ColaboradoresGrouped object) async {
    await (delete(conhecimentotecnicos)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(engajamentoproatividades)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(capacidadecomunicacaos)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(resultadosatingidoss)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(capacitacaotreinamentoss)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(feedbacksupervisoress)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(resolucaoproblemass)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
    await (delete(assiduidadepontualidades)
          ..where((t) => t.colaboradorid.equals(object.colaboradores!.colaboradorid!)))
        .go();
  }

  Future<int> lastPk() async {
    final result = await customSelect("select MAX(colaboradorid) as LAST from colaboradores")
        .getSingleOrNull();
    return result?.data["LAST"] ?? 0;
  }
}
