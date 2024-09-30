import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Resolucaoproblemas")
class Resolucaoproblemass extends Table {
	@override
	String get tableName => 'resolucaoproblemas';

	IntColumn get resolucaoid => integer().named('resolucaoid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	TextColumn get descricaoproblemaresolvido => text().named('descricaoproblemaresolvido').withLength(min: 0, max: 450).nullable()();
	DateTimeColumn get dataresolucao => dateTime().named('dataresolucao').nullable()();
	IntColumn get avaliacaoresolucao => integer().named('avaliacaoresolucao').nullable()();

	@override
	Set<Column> get primaryKey => { resolucaoid };	
	
}

class ResolucaoproblemasGrouped {
	Resolucaoproblemas? resolucaoproblemas; 

  ResolucaoproblemasGrouped({
		this.resolucaoproblemas, 

  });
}
