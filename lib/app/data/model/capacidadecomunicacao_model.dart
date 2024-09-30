import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class CapacidadecomunicacaoModel {
	int? comunicacaoid;
	int? colaboradorid;
	int? avaliacaocomunicacao;
	String? feedbackcomunicacao;
	DateTime? dataavaliacao;

	CapacidadecomunicacaoModel({
		this.comunicacaoid,
		this.colaboradorid,
		this.avaliacaocomunicacao,
		this.feedbackcomunicacao,
		this.dataavaliacao,
	});

	static List<String> dbColumns = <String>[
		'comunicacaoid',
		'avaliacaocomunicacao',
		'feedbackcomunicacao',
		'dataavaliacao',
	];
	
	static List<String> aliasColumns = <String>[
		'Comunicacaoid',
		'Avaliacaocomunicacao',
		'Feedbackcomunicacao',
		'Dataavaliacao',
	];

	CapacidadecomunicacaoModel.fromJson(Map<String, dynamic> jsonData) {
		comunicacaoid = jsonData['comunicacaoid'];
		colaboradorid = jsonData['colaboradorid'];
		avaliacaocomunicacao = jsonData['avaliacaocomunicacao'];
		feedbackcomunicacao = jsonData['feedbackcomunicacao'];
		dataavaliacao = jsonData['dataavaliacao'] != null ? DateTime.tryParse(jsonData['dataavaliacao']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['comunicacaoid'] = comunicacaoid != 0 ? comunicacaoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['avaliacaocomunicacao'] = avaliacaocomunicacao;
		jsonData['feedbackcomunicacao'] = feedbackcomunicacao;
		jsonData['dataavaliacao'] = dataavaliacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataavaliacao!) : null;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		comunicacaoid = plutoRow.cells['comunicacaoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		avaliacaocomunicacao = plutoRow.cells['avaliacaocomunicacao']?.value;
		feedbackcomunicacao = plutoRow.cells['feedbackcomunicacao']?.value;
		dataavaliacao = Util.stringToDate(plutoRow.cells['dataavaliacao']?.value);
	}	

	CapacidadecomunicacaoModel clone() {
		return CapacidadecomunicacaoModel(
			comunicacaoid: comunicacaoid,
			colaboradorid: colaboradorid,
			avaliacaocomunicacao: avaliacaocomunicacao,
			feedbackcomunicacao: feedbackcomunicacao,
			dataavaliacao: dataavaliacao,
		);			
	}

	
}