import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class AssiduidadepontualidadeModel {
	int? assiduidadeid;
	int? colaboradorid;
	int? faltasinjustificadas;
	int? atrasos;
	DateTime? dataregistro;

	AssiduidadepontualidadeModel({
		this.assiduidadeid,
		this.colaboradorid,
		this.faltasinjustificadas,
		this.atrasos,
		this.dataregistro,
	});

	static List<String> dbColumns = <String>[
		'assiduidadeid',
		'faltasinjustificadas',
		'atrasos',
		'dataregistro',
	];
	
	static List<String> aliasColumns = <String>[
		'Assiduidadeid',
		'Faltasinjustificadas',
		'Atrasos',
		'Dataregistro',
	];

	AssiduidadepontualidadeModel.fromJson(Map<String, dynamic> jsonData) {
		assiduidadeid = jsonData['assiduidadeid'];
		colaboradorid = jsonData['colaboradorid'];
		faltasinjustificadas = jsonData['faltasinjustificadas'];
		atrasos = jsonData['atrasos'];
		dataregistro = jsonData['dataregistro'] != null ? DateTime.tryParse(jsonData['dataregistro']) : null;
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['assiduidadeid'] = assiduidadeid != 0 ? assiduidadeid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['faltasinjustificadas'] = faltasinjustificadas;
		jsonData['atrasos'] = atrasos;
		jsonData['dataregistro'] = dataregistro != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataregistro!) : null;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		assiduidadeid = plutoRow.cells['assiduidadeid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		faltasinjustificadas = plutoRow.cells['faltasinjustificadas']?.value;
		atrasos = plutoRow.cells['atrasos']?.value;
		dataregistro = Util.stringToDate(plutoRow.cells['dataregistro']?.value);
	}	

	AssiduidadepontualidadeModel clone() {
		return AssiduidadepontualidadeModel(
			assiduidadeid: assiduidadeid,
			colaboradorid: colaboradorid,
			faltasinjustificadas: faltasinjustificadas,
			atrasos: atrasos,
			dataregistro: dataregistro,
		);			
	}

	
}