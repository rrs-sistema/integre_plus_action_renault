import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Conhecimentotecnico")
class Conhecimentotecnicos extends Table {
	@override
	String get tableName => 'conhecimentotecnico';

	IntColumn get conhecimentoid => integer().named('conhecimentoid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	TextColumn get descricaoconhecimento => text().named('descricaoconhecimento').withLength(min: 0, max: 200).nullable()();
	TextColumn get nivelconhecimento => text().named('nivelconhecimento').withLength(min: 0, max: 50).nullable()();
	DateTimeColumn get dataavaliacao => dateTime().named('dataavaliacao').nullable()();

	@override
	Set<Column> get primaryKey => { conhecimentoid };	
	
}

class ConhecimentotecnicoGrouped {
	Conhecimentotecnico? conhecimentotecnico; 

  ConhecimentotecnicoGrouped({
		this.conhecimentotecnico, 

  });
}
