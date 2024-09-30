import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Capacitacaotreinamentos")
class Capacitacaotreinamentoss extends Table {
	@override
	String get tableName => 'capacitacaotreinamentos';

	IntColumn get treinamentoid => integer().named('treinamentoid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	TextColumn get nometreinamento => text().named('nometreinamento').withLength(min: 0, max: 150).nullable()();
	DateTimeColumn get dataconclusao => dateTime().named('dataconclusao').nullable()();
	BoolColumn get certificado => boolean().named('certificado').nullable()();

	@override
	Set<Column> get primaryKey => { treinamentoid };	
	
}

class CapacitacaotreinamentosGrouped {
	Capacitacaotreinamentos? capacitacaotreinamentos; 

  CapacitacaotreinamentosGrouped({
		this.capacitacaotreinamentos, 

  });
}
