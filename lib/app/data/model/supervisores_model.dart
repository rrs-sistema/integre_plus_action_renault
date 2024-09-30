import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class SupervisoresModel {
	int? supervisorid;
	String? nome;
	String? cargo;
	String? email;
	String? telefone;
	DateTime? dataadmissao;
	String? status;

	SupervisoresModel({
		this.supervisorid,
		this.nome,
		this.cargo,
		this.email,
		this.telefone,
		this.dataadmissao,
		this.status,
	});

	static List<String> dbColumns = <String>[
		'supervisorid',
		'nome',
		'cargo',
		'email',
		'telefone',
		'dataadmissao',
		'status',
	];
	
	static List<String> aliasColumns = <String>[
		'Supervisorid',
		'Nome',
		'Cargo',
		'Email',
		'Telefone',
		'Dataadmissao',
		'Status',
	];

	SupervisoresModel.fromJson(Map<String, dynamic> jsonData) {
		supervisorid = jsonData['supervisorid'];
		nome = jsonData['nome'];
		cargo = jsonData['cargo'];
		email = jsonData['email'];
		telefone = jsonData['telefone'];
		dataadmissao = jsonData['dataadmissao'] != null ? DateTime.tryParse(jsonData['dataadmissao']) : null;
		status = jsonData['status'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['supervisorid'] = supervisorid != 0 ? supervisorid : null;
		jsonData['nome'] = nome;
		jsonData['cargo'] = cargo;
		jsonData['email'] = email;
		jsonData['telefone'] = telefone;
		jsonData['dataadmissao'] = dataadmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataadmissao!) : null;
		jsonData['status'] = status;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		supervisorid = plutoRow.cells['supervisorid']?.value;
		nome = plutoRow.cells['nome']?.value;
		cargo = plutoRow.cells['cargo']?.value;
		email = plutoRow.cells['email']?.value;
		telefone = plutoRow.cells['telefone']?.value;
		dataadmissao = Util.stringToDate(plutoRow.cells['dataadmissao']?.value);
		status = plutoRow.cells['status']?.value;
	}	

	SupervisoresModel clone() {
		return SupervisoresModel(
			supervisorid: supervisorid,
			nome: nome,
			cargo: cargo,
			email: email,
			telefone: telefone,
			dataadmissao: dataadmissao,
			status: status,
		);			
	}

	
}