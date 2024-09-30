import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Supervisores")
class Supervisoress extends Table {
	@override
	String get tableName => 'supervisores';

	IntColumn get supervisorid => integer().named('supervisorid').nullable()();
	TextColumn get nome => text().named('nome').withLength(min: 0, max: 100).nullable()();
	TextColumn get cargo => text().named('cargo').withLength(min: 0, max: 100).nullable()();
	TextColumn get email => text().named('email').withLength(min: 0, max: 100).nullable()();
	TextColumn get telefone => text().named('telefone').withLength(min: 0, max: 20).nullable()();
	DateTimeColumn get dataadmissao => dateTime().named('dataadmissao').nullable()();
	TextColumn get status => text().named('status').withLength(min: 0, max: 50).nullable()();

	@override
	Set<Column> get primaryKey => { supervisorid };	
	
}

class SupervisoresGrouped {
	Supervisores? supervisores; 

  SupervisoresGrouped({
		this.supervisores, 

  });
}
