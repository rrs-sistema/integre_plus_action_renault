import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class ConhecimentotecnicoModel {
	int? conhecimentoid;
	int? colaboradorid;
	String? descricaoconhecimento;
	String? nivelconhecimento;
	DateTime? dataavaliacao;

	ConhecimentotecnicoModel({
		this.conhecimentoid,
		this.colaboradorid,
		this.descricaoconhecimento,
		this.nivelconhecimento,
		this.dataavaliacao,
	});

	static List<String> dbColumns = <String>[
		'conhecimentoid',
		'descricaoconhecimento',
		'nivelconhecimento',
		'dataavaliacao',
	];
	
	static List<String> aliasColumns = <String>[
		'Conhecimentoid',
		'Descricaoconhecimento',
		'Nivelconhecimento',
		'Dataavaliacao',
	];

	ConhecimentotecnicoModel.fromJson(Map<String, dynamic> jsonData) {
		conhecimentoid = jsonData['conhecimentoid'];
		colaboradorid = jsonData['colaboradorid'];
		descricaoconhecimento = jsonData['descricaoconhecimento'];
		nivelconhecimento = jsonData['nivelconhecimento'];
		dataavaliacao = jsonData['dataavaliacao'] != null ? DateTime.tryParse(jsonData['dataavaliacao']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['conhecimentoid'] = conhecimentoid != 0 ? conhecimentoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['descricaoconhecimento'] = descricaoconhecimento;
		jsonData['nivelconhecimento'] = nivelconhecimento;
		jsonData['dataavaliacao'] = dataavaliacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataavaliacao!) : null;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		conhecimentoid = plutoRow.cells['conhecimentoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		descricaoconhecimento = plutoRow.cells['descricaoconhecimento']?.value;
		nivelconhecimento = plutoRow.cells['nivelconhecimento']?.value;
		dataavaliacao = Util.stringToDate(plutoRow.cells['dataavaliacao']?.value);
	}	

	ConhecimentotecnicoModel clone() {
		return ConhecimentotecnicoModel(
			conhecimentoid: conhecimentoid,
			colaboradorid: colaboradorid,
			descricaoconhecimento: descricaoconhecimento,
			nivelconhecimento: nivelconhecimento,
			dataavaliacao: dataavaliacao,
		);			
	}

	
}