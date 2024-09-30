import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class EngajamentoproatividadeModel {
	int? engajamentoid;
	int? colaboradorid;
	int? pontuacaoengajamento;
	int? propostasmelhoria ;
	DateTime? dataavaliacao;

	EngajamentoproatividadeModel({
		this.engajamentoid,
		this.colaboradorid,
		this.pontuacaoengajamento,
		this.propostasmelhoria ,
		this.dataavaliacao,
	});

	static List<String> dbColumns = <String>[
		'engajamentoid',
		'pontuacaoengajamento',
		'propostasmelhoria ',
		'dataavaliacao',
	];
	
	static List<String> aliasColumns = <String>[
		'Engajamentoid',
		'Pontuacaoengajamento',
		'Propostasmelhoria ',
		'Dataavaliacao',
	];

	EngajamentoproatividadeModel.fromJson(Map<String, dynamic> jsonData) {
		engajamentoid = jsonData['engajamentoid'];
		colaboradorid = jsonData['colaboradorid'];
		pontuacaoengajamento = jsonData['pontuacaoengajamento'];
		propostasmelhoria  = jsonData['propostasmelhoria '];
		dataavaliacao = jsonData['dataavaliacao'] != null ? DateTime.tryParse(jsonData['dataavaliacao']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['engajamentoid'] = engajamentoid != 0 ? engajamentoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['pontuacaoengajamento'] = pontuacaoengajamento;
		jsonData['propostasmelhoria '] = propostasmelhoria ;
		jsonData['dataavaliacao'] = dataavaliacao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataavaliacao!) : null;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		engajamentoid = plutoRow.cells['engajamentoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		pontuacaoengajamento = plutoRow.cells['pontuacaoengajamento']?.value;
		propostasmelhoria  = plutoRow.cells['propostasmelhoria ']?.value;
		dataavaliacao = Util.stringToDate(plutoRow.cells['dataavaliacao']?.value);
	}	

	EngajamentoproatividadeModel clone() {
		return EngajamentoproatividadeModel(
			engajamentoid: engajamentoid,
			colaboradorid: colaboradorid,
			pontuacaoengajamento: pontuacaoengajamento,
			propostasmelhoria : propostasmelhoria ,
			dataavaliacao: dataavaliacao,
		);			
	}

	
}