import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class CapacitacaotreinamentosModel {
	int? treinamentoid;
	int? colaboradorid;
	String? nometreinamento;
	DateTime? dataconclusao;
	bool? certificado;

	CapacitacaotreinamentosModel({
		this.treinamentoid,
		this.colaboradorid,
		this.nometreinamento,
		this.dataconclusao,
		this.certificado,
	});

	static List<String> dbColumns = <String>[
		'treinamentoid',
		'nometreinamento',
		'dataconclusao',
		'certificado',
	];
	
	static List<String> aliasColumns = <String>[
		'Treinamentoid',
		'Nometreinamento',
		'Dataconclusao',
		'Certificado',
	];

	CapacitacaotreinamentosModel.fromJson(Map<String, dynamic> jsonData) {
		treinamentoid = jsonData['treinamentoid'];
		colaboradorid = jsonData['colaboradorid'];
		nometreinamento = jsonData['nometreinamento'];
		dataconclusao = jsonData['dataconclusao'] != null ? DateTime.tryParse(jsonData['dataconclusao']) : null;
		certificado = jsonData['certificado'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['treinamentoid'] = treinamentoid != 0 ? treinamentoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['nometreinamento'] = nometreinamento;
		jsonData['dataconclusao'] = dataconclusao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataconclusao!) : null;
		jsonData['certificado'] = certificado;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		treinamentoid = plutoRow.cells['treinamentoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		nometreinamento = plutoRow.cells['nometreinamento']?.value;
		dataconclusao = Util.stringToDate(plutoRow.cells['dataconclusao']?.value);
		certificado = plutoRow.cells['certificado']?.value;
	}	

	CapacitacaotreinamentosModel clone() {
		return CapacitacaotreinamentosModel(
			treinamentoid: treinamentoid,
			colaboradorid: colaboradorid,
			nometreinamento: nometreinamento,
			dataconclusao: dataconclusao,
			certificado: certificado,
		);			
	}

	
}