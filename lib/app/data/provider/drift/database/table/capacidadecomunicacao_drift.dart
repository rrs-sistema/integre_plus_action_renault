import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Capacidadecomunicacao")
class Capacidadecomunicacaos extends Table {
	@override
	String get tableName => 'capacidadecomunicacao';

	IntColumn get comunicacaoid => integer().named('comunicacaoid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	IntColumn get avaliacaocomunicacao => integer().named('avaliacaocomunicacao').nullable()();
	TextColumn get feedbackcomunicacao => text().named('feedbackcomunicacao').nullable()();
	DateTimeColumn get dataavaliacao => dateTime().named('dataavaliacao').nullable()();

	@override
	Set<Column> get primaryKey => { comunicacaoid };	
	
}

class CapacidadecomunicacaoGrouped {
	Capacidadecomunicacao? capacidadecomunicacao; 

  CapacidadecomunicacaoGrouped({
		this.capacidadecomunicacao, 

  });
}
