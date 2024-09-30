import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:intl/intl.dart';

class FeedbacksupervisoresModel {
	int? feedbackid;
	int? colaboradorid;
	int? supervisoridSupervisores;
	String? feedback;
	DateTime? datafeedback;
	SupervisoresModel? supervisoresModel;

	FeedbacksupervisoresModel({
		this.feedbackid,
		this.colaboradorid,
		this.supervisoridSupervisores,
		this.feedback,
		this.datafeedback,
		this.supervisoresModel,
	});

	static List<String> dbColumns = <String>[
		'feedbackid',
		'feedback',
		'datafeedback',
	];
	
	static List<String> aliasColumns = <String>[
		'Feedbackid',
		'Feedback',
		'Datafeedback',
	];

	FeedbacksupervisoresModel.fromJson(Map<String, dynamic> jsonData) {
		feedbackid = jsonData['feedbackid'];
		colaboradorid = jsonData['colaboradorid'];
		supervisoridSupervisores = jsonData['supervisoridSupervisores'];
		feedback = jsonData['feedback'];
		datafeedback = jsonData['datafeedback'] != null ? DateTime.tryParse(jsonData['datafeedback']) : null;
		supervisoresModel = jsonData['supervisoresModel'] == null ? SupervisoresModel() : SupervisoresModel.fromJson(jsonData['supervisoresModel']);
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['feedbackid'] = feedbackid != 0 ? feedbackid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['supervisoridSupervisores'] = supervisoridSupervisores != 0 ? supervisoridSupervisores : null;
		jsonData['feedback'] = feedback;
		jsonData['datafeedback'] = datafeedback != null ? DateFormat('yyyy-MM-ddT00:00:00').format(datafeedback!) : null;
		jsonData['supervisoresModel'] = supervisoresModel?.toJson;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		feedbackid = plutoRow.cells['feedbackid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		supervisoridSupervisores = plutoRow.cells['supervisoridSupervisores']?.value;
		feedback = plutoRow.cells['feedback']?.value;
		datafeedback = Util.stringToDate(plutoRow.cells['datafeedback']?.value);
		supervisoresModel = SupervisoresModel();
		supervisoresModel?.nome = plutoRow.cells['supervisoresModel']?.value;
	}	

	FeedbacksupervisoresModel clone() {
		return FeedbacksupervisoresModel(
			feedbackid: feedbackid,
			colaboradorid: colaboradorid,
			supervisoridSupervisores: supervisoridSupervisores,
			feedback: feedback,
			datafeedback: datafeedback,
		);			
	}

	
}