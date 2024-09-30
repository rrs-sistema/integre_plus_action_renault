import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Assiduidadepontualidade")
class Assiduidadepontualidades extends Table {
	@override
	String get tableName => 'assiduidadepontualidade';

	IntColumn get assiduidadeid => integer().named('assiduidadeid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	IntColumn get faltasinjustificadas => integer().named('faltasinjustificadas').nullable()();
	IntColumn get atrasos => integer().named('atrasos').nullable()();
	DateTimeColumn get dataregistro => dateTime().named('dataregistro').nullable()();

	@override
	Set<Column> get primaryKey => { assiduidadeid };	
	
}

class AssiduidadepontualidadeGrouped {
	Assiduidadepontualidade? assiduidadepontualidade; 

  AssiduidadepontualidadeGrouped({
		this.assiduidadepontualidade, 

  });
}
