import 'package:drift/drift.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';

@DataClassName("Feedbacksupervisores")
class Feedbacksupervisoress extends Table {
	@override
	String get tableName => 'feedbacksupervisores';

	IntColumn get feedbackid => integer().named('feedbackid').nullable()();
	IntColumn get supervisoridSupervisores => integer().named('supervisorid_supervisores').nullable()();
	IntColumn get colaboradorid => integer().named('colaboradorid').nullable()();
	TextColumn get feedback => text().named('feedback').withLength(min: 0, max: 450).nullable()();
	DateTimeColumn get datafeedback => dateTime().named('datafeedback').nullable()();

	@override
	Set<Column> get primaryKey => { feedbackid };	
	
}

class FeedbacksupervisoresGrouped {
	Feedbacksupervisores? feedbacksupervisores; 
	Supervisores? supervisores; 

  FeedbacksupervisoresGrouped({
		this.feedbacksupervisores, 
		this.supervisores, 

  });
}
