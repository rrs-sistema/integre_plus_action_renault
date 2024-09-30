import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';

@DataClassName("Colaboradores")
class Colaboradoress extends Table {
	@override
	String get tableName => 'colaboradores';

	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	TextColumn get nome => text().named('nome').withLength(min: 0, max: 100).nullable()();
	TextColumn get cargoatual => text().named('cargoatual').withLength(min: 0, max: 100).nullable()();
	DateTimeColumn get dataadmissao => dateTime().named('dataadmissao').nullable()();
	IntColumn get experienciaatual => integer().named('experienciaatual').nullable()();
	TextColumn get telefone => text().named('telefone').withLength(min: 0, max: 20).nullable()();
	TextColumn get status => text().named('status').withLength(min: 0, max: 50).nullable()();

	@override
	Set<Column> get primaryKey => { colaboradorid };	
	
}

class ColaboradoresGrouped {
	Colaboradores? colaboradores; 
	List<ConhecimentotecnicoGrouped>? conhecimentotecnicoGroupedList; 
	List<EngajamentoproatividadeGrouped>? engajamentoproatividadeGroupedList; 
	List<CapacidadecomunicacaoGrouped>? capacidadecomunicacaoGroupedList; 
	List<ResultadosatingidosGrouped>? resultadosatingidosGroupedList; 
	List<CapacitacaotreinamentosGrouped>? capacitacaotreinamentosGroupedList; 
	List<FeedbacksupervisoresGrouped>? feedbacksupervisoresGroupedList; 
	List<ResolucaoproblemasGrouped>? resolucaoproblemasGroupedList; 
	List<AssiduidadepontualidadeGrouped>? assiduidadepontualidadeGroupedList; 

  ColaboradoresGrouped({
		this.colaboradores, 
		this.conhecimentotecnicoGroupedList, 
		this.engajamentoproatividadeGroupedList, 
		this.capacidadecomunicacaoGroupedList, 
		this.resultadosatingidosGroupedList, 
		this.capacitacaotreinamentosGroupedList, 
		this.feedbacksupervisoresGroupedList, 
		this.resolucaoproblemasGroupedList, 
		this.assiduidadepontualidadeGroupedList, 

  });
}
