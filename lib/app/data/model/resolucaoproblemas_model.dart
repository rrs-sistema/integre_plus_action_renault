import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:intl/intl.dart';

class ResolucaoproblemasModel {
	int? resolucaoid;
	int? colaboradorid;
	String? descricaoproblemaresolvido;
	DateTime? dataresolucao;
	int? avaliacaoresolucao;

	ResolucaoproblemasModel({
		this.resolucaoid,
		this.colaboradorid,
		this.descricaoproblemaresolvido,
		this.dataresolucao,
		this.avaliacaoresolucao,
	});

	static List<String> dbColumns = <String>[
		'resolucaoid',
		'descricaoproblemaresolvido',
		'dataresolucao',
		'avaliacaoresolucao',
	];
	
	static List<String> aliasColumns = <String>[
		'Resolucaoid',
		'Descricaoproblemaresolvido',
		'Dataresolucao',
		'Avaliacaoresolucao',
	];

	ResolucaoproblemasModel.fromJson(Map<String, dynamic> jsonData) {
		resolucaoid = jsonData['resolucaoid'];
		colaboradorid = jsonData['colaboradorid'];
		descricaoproblemaresolvido = jsonData['descricaoproblemaresolvido'];
		dataresolucao = jsonData['dataresolucao'] != null ? DateTime.tryParse(jsonData['dataresolucao']) : null;
		avaliacaoresolucao = jsonData['avaliacaoresolucao'];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['resolucaoid'] = resolucaoid != 0 ? resolucaoid : null;
		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['descricaoproblemaresolvido'] = descricaoproblemaresolvido;
		jsonData['dataresolucao'] = dataresolucao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataresolucao!) : null;
		jsonData['avaliacaoresolucao'] = avaliacaoresolucao;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		resolucaoid = plutoRow.cells['resolucaoid']?.value;
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		descricaoproblemaresolvido = plutoRow.cells['descricaoproblemaresolvido']?.value;
		dataresolucao = Util.stringToDate(plutoRow.cells['dataresolucao']?.value);
		avaliacaoresolucao = plutoRow.cells['avaliacaoresolucao']?.value;
	}	

	ResolucaoproblemasModel clone() {
		return ResolucaoproblemasModel(
			resolucaoid: resolucaoid,
			colaboradorid: colaboradorid,
			descricaoproblemaresolvido: descricaoproblemaresolvido,
			dataresolucao: dataresolucao,
			avaliacaoresolucao: avaliacaoresolucao,
		);			
	}

	
}