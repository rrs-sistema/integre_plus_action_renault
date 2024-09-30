import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Resultadosatingidos")
class Resultadosatingidoss extends Table {
	@override
	String get tableName => 'resultadosatingidos';

	IntColumn get resultadoid => integer().named('resultadoid').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	IntColumn get metasatingidas => integer().named('metasatingidas').nullable()();
	DateTimeColumn get dataavaliacao => dateTime().named('dataavaliacao').nullable()();
	IntColumn get pontuacaoprodutividade => integer().named('pontuacaoprodutividade').nullable()();
	IntColumn get defeitosproduzidos => integer().named('defeitosproduzidos').nullable()();

	@override
	Set<Column> get primaryKey => { resultadoid };	
	
}

class ResultadosatingidosGrouped {
	Resultadosatingidos? resultadosatingidos; 

  ResultadosatingidosGrouped({
		this.resultadosatingidos, 

  });
}
