import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Engajamentoproatividade")
class Engajamentoproatividades extends Table {
  @override
  String get tableName => 'engajamentoproatividade';

  IntColumn get engajamentoid => integer().named('engajamentoid').nullable()();
  IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
  IntColumn get pontuacaoengajamento => integer().named('pontuacaoengajamento').nullable()();
  IntColumn get propostasmelhoria => integer().named('propostasmelhoria').nullable()();
  DateTimeColumn get dataavaliacao => dateTime().named('dataavaliacao').nullable()();

  @override
  Set<Column> get primaryKey => {engajamentoid};
}

class EngajamentoproatividadeGrouped {
  Engajamentoproatividade? engajamentoproatividade;

  EngajamentoproatividadeGrouped({
    this.engajamentoproatividade,
  });
}
