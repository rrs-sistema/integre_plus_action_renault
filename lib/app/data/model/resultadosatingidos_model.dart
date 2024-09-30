import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class ResultadosatingidosModel {
	int? resultadoid;
	int? colaboradorid;
	int? metasatingidas;
	int? pontuacaoprodutividade;
	int? defeitosproduzidos;
	DateTime? dataavaliacao;

	ResultadosatingidosModel({
		this.resultadoid,
		this.colaboradorid,
		this.metasatingidas,
		this.pontuacaoprodutividade,
		this.defeitosproduzidos,
		this.dataavaliacao,
	});

	static List<String> dbColumns = <String>[
		'resultadoid',
		'metasatingidas',
		'pontuacaoprodutividade',
		'defeitosproduzidos',
		'dataavaliacao',
	];
	
	static List<String> aliasColumns = <String>[
		'Resultadoid',
		'Metasatingidas',
		'Pontuacaoprodutividade',
		'Defeitosproduzidos',
		'Dataavaliacao',
	];

	ResultadosatingidosModel.fromJson(Map<String, dynamic> jsonData) {
		resultadoid = jsonData['resultadoid'];
		colaboradorid = jsonData['colaboradorid'];
		metasatingidas = jsonData['metasatingidas'];
		pontuacaoprodutividade = jsonData['pontuacaoprodutividade'];
		defeitosproduzidos = jsonData['defeitosproduzidos'];
		dataavaliacao = jsonData['dataavaliacao'] != null ? DateTime.tryParse(jsonData['dataavaliacao']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['resultadoid'] = resultadoid != 0 ? resultadoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['metasatingidas'] = metasatingidas;
		jsonData['pontuacaoprodutividade'] = pontuacaoprodutividade;
		jsonData['defeitosproduzidos'] = defeitosproduzidos;
		jsonData['dataavaliacao'] = dataavaliacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataavaliacao!) : null;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		resultadoid = plutoRow.cells['resultadoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		metasatingidas = plutoRow.cells['metasatingidas']?.value;
		pontuacaoprodutividade = plutoRow.cells['pontuacaoprodutividade']?.value;
		defeitosproduzidos = plutoRow.cells['defeitosproduzidos']?.value;
		dataavaliacao = Util.stringToDate(plutoRow.cells['dataavaliacao']?.value);
	}	

	ResultadosatingidosModel clone() {
		return ResultadosatingidosModel(
			resultadoid: resultadoid,
			colaboradorid: colaboradorid,
			metasatingidas: metasatingidas,
			pontuacaoprodutividade: pontuacaoprodutividade,
			defeitosproduzidos: defeitosproduzidos,
			dataavaliacao: dataavaliacao,
		);			
	}

	
}