import 'dart:convert';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';
import 'package:intl/intl.dart';

class ColaboradoresModel {
	int? colaboradorid;
	String? nome;
	String? cargoatual;
	DateTime? dataadmissao;
	int? experienciaatual;
	String? telefone;
	String? status;
	List<ConhecimentotecnicoModel>? conhecimentotecnicoModelList;
	List<EngajamentoproatividadeModel>? engajamentoproatividadeModelList;
	List<CapacidadecomunicacaoModel>? capacidadecomunicacaoModelList;
	List<ResultadosatingidosModel>? resultadosatingidosModelList;
	List<CapacitacaotreinamentosModel>? capacitacaotreinamentosModelList;
	List<FeedbacksupervisoresModel>? feedbacksupervisoresModelList;
	List<ResolucaoproblemasModel>? resolucaoproblemasModelList;
	List<AssiduidadepontualidadeModel>? assiduidadepontualidadeModelList;

	ColaboradoresModel({
		this.colaboradorid,
		this.nome,
		this.cargoatual,
		this.dataadmissao,
		this.experienciaatual,
		this.telefone,
		this.status,
		this.conhecimentotecnicoModelList,
		this.engajamentoproatividadeModelList,
		this.capacidadecomunicacaoModelList,
		this.resultadosatingidosModelList,
		this.capacitacaotreinamentosModelList,
		this.feedbacksupervisoresModelList,
		this.resolucaoproblemasModelList,
		this.assiduidadepontualidadeModelList,
	});

	static List<String> dbColumns = <String>[
		'colaboradorid',
		'nome',
		'cargoatual',
		'dataadmissao',
		'experienciaatual',
		'telefone',
		'status',
	];
	
	static List<String> aliasColumns = <String>[
		'Colaboradorid',
		'Nome',
		'Cargoatual',
		'Dataadmissao',
		'Experienciaatual',
		'Telefone',
		'Status',
	];

	ColaboradoresModel.fromJson(Map<String, dynamic> jsonData) {
		colaboradorid = jsonData['colaboradorid'];
		nome = jsonData['nome'];
		cargoatual = jsonData['cargoatual'];
		dataadmissao = jsonData['dataadmissao'] != null ? DateTime.tryParse(jsonData['dataadmissao']) : null;
		experienciaatual = jsonData['experienciaatual'];
		telefone = jsonData['telefone'];
		status = jsonData['status'];
		conhecimentotecnicoModelList = (jsonData['conhecimentotecnicoModelList'] as Iterable?)?.map((m) => ConhecimentotecnicoModel.fromJson(m)).toList() ?? [];
		engajamentoproatividadeModelList = (jsonData['engajamentoproatividadeModelList'] as Iterable?)?.map((m) => EngajamentoproatividadeModel.fromJson(m)).toList() ?? [];
		capacidadecomunicacaoModelList = (jsonData['capacidadecomunicacaoModelList'] as Iterable?)?.map((m) => CapacidadecomunicacaoModel.fromJson(m)).toList() ?? [];
		resultadosatingidosModelList = (jsonData['resultadosatingidosModelList'] as Iterable?)?.map((m) => ResultadosatingidosModel.fromJson(m)).toList() ?? [];
		capacitacaotreinamentosModelList = (jsonData['capacitacaotreinamentosModelList'] as Iterable?)?.map((m) => CapacitacaotreinamentosModel.fromJson(m)).toList() ?? [];
		feedbacksupervisoresModelList = (jsonData['feedbacksupervisoresModelList'] as Iterable?)?.map((m) => FeedbacksupervisoresModel.fromJson(m)).toList() ?? [];
		resolucaoproblemasModelList = (jsonData['resolucaoproblemasModelList'] as Iterable?)?.map((m) => ResolucaoproblemasModel.fromJson(m)).toList() ?? [];
		assiduidadepontualidadeModelList = (jsonData['assiduidadepontualidadeModelList'] as Iterable?)?.map((m) => AssiduidadepontualidadeModel.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonData = <String, dynamic>{};

		jsonData['colaboradorid'] = colaboradorid != 0 ? colaboradorid : null;
		jsonData['nome'] = nome;
		jsonData['cargoatual'] = cargoatual;
		jsonData['dataadmissao'] = dataadmissao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataadmissao!) : null;
		jsonData['experienciaatual'] = experienciaatual;
		jsonData['telefone'] = telefone;
		jsonData['status'] = status;
		
		var conhecimentotecnicoModelLocalList = []; 
		for (ConhecimentotecnicoModel object in conhecimentotecnicoModelList ?? []) { 
			conhecimentotecnicoModelLocalList.add(object.toJson); 
		}
		jsonData['conhecimentotecnicoModelList'] = conhecimentotecnicoModelLocalList;
		
		var engajamentoproatividadeModelLocalList = []; 
		for (EngajamentoproatividadeModel object in engajamentoproatividadeModelList ?? []) { 
			engajamentoproatividadeModelLocalList.add(object.toJson); 
		}
		jsonData['engajamentoproatividadeModelList'] = engajamentoproatividadeModelLocalList;
		
		var capacidadecomunicacaoModelLocalList = []; 
		for (CapacidadecomunicacaoModel object in capacidadecomunicacaoModelList ?? []) { 
			capacidadecomunicacaoModelLocalList.add(object.toJson); 
		}
		jsonData['capacidadecomunicacaoModelList'] = capacidadecomunicacaoModelLocalList;
		
		var resultadosatingidosModelLocalList = []; 
		for (ResultadosatingidosModel object in resultadosatingidosModelList ?? []) { 
			resultadosatingidosModelLocalList.add(object.toJson); 
		}
		jsonData['resultadosatingidosModelList'] = resultadosatingidosModelLocalList;
		
		var capacitacaotreinamentosModelLocalList = []; 
		for (CapacitacaotreinamentosModel object in capacitacaotreinamentosModelList ?? []) { 
			capacitacaotreinamentosModelLocalList.add(object.toJson); 
		}
		jsonData['capacitacaotreinamentosModelList'] = capacitacaotreinamentosModelLocalList;
		
		var feedbacksupervisoresModelLocalList = []; 
		for (FeedbacksupervisoresModel object in feedbacksupervisoresModelList ?? []) { 
			feedbacksupervisoresModelLocalList.add(object.toJson); 
		}
		jsonData['feedbacksupervisoresModelList'] = feedbacksupervisoresModelLocalList;
		
		var resolucaoproblemasModelLocalList = []; 
		for (ResolucaoproblemasModel object in resolucaoproblemasModelList ?? []) { 
			resolucaoproblemasModelLocalList.add(object.toJson); 
		}
		jsonData['resolucaoproblemasModelList'] = resolucaoproblemasModelLocalList;
		
		var assiduidadepontualidadeModelLocalList = []; 
		for (AssiduidadepontualidadeModel object in assiduidadepontualidadeModelList ?? []) { 
			assiduidadepontualidadeModelLocalList.add(object.toJson); 
		}
		jsonData['assiduidadepontualidadeModelList'] = assiduidadepontualidadeModelLocalList;
	
		return jsonData;
	}
	
	String objectEncodeJson() {
		final jsonData = toJson;
		return json.encode(jsonData);
	}

	plutoRowToObject(PlutoRow plutoRow) {
		colaboradorid = plutoRow.cells['colaboradorid']?.value;
		nome = plutoRow.cells['nome']?.value;
		cargoatual = plutoRow.cells['cargoatual']?.value;
		dataadmissao = Util.stringToDate(plutoRow.cells['dataadmissao']?.value);
		experienciaatual = plutoRow.cells['experienciaatual']?.value;
		telefone = plutoRow.cells['telefone']?.value;
		status = plutoRow.cells['status']?.value;
		conhecimentotecnicoModelList = [];
		engajamentoproatividadeModelList = [];
		capacidadecomunicacaoModelList = [];
		resultadosatingidosModelList = [];
		capacitacaotreinamentosModelList = [];
		feedbacksupervisoresModelList = [];
		resolucaoproblemasModelList = [];
		assiduidadepontualidadeModelList = [];
	}	

	ColaboradoresModel clone() {
		return ColaboradoresModel(
			colaboradorid: colaboradorid,
			nome: nome,
			cargoatual: cargoatual,
			dataadmissao: dataadmissao,
			experienciaatual: experienciaatual,
			telefone: telefone,
			status: status,
			conhecimentotecnicoModelList: conhecimentotecnicoModelListClone(conhecimentotecnicoModelList!),
			engajamentoproatividadeModelList: engajamentoproatividadeModelListClone(engajamentoproatividadeModelList!),
			capacidadecomunicacaoModelList: capacidadecomunicacaoModelListClone(capacidadecomunicacaoModelList!),
			resultadosatingidosModelList: resultadosatingidosModelListClone(resultadosatingidosModelList!),
			capacitacaotreinamentosModelList: capacitacaotreinamentosModelListClone(capacitacaotreinamentosModelList!),
			feedbacksupervisoresModelList: feedbacksupervisoresModelListClone(feedbacksupervisoresModelList!),
			resolucaoproblemasModelList: resolucaoproblemasModelListClone(resolucaoproblemasModelList!),
			assiduidadepontualidadeModelList: assiduidadepontualidadeModelListClone(assiduidadepontualidadeModelList!),
		);			
	}

	conhecimentotecnicoModelListClone(List<ConhecimentotecnicoModel> conhecimentotecnicoModelList) { 
		List<ConhecimentotecnicoModel> resultList = [];
		for (var conhecimentotecnicoModel in conhecimentotecnicoModelList) {
			resultList.add(
				ConhecimentotecnicoModel(
					conhecimentoid: conhecimentotecnicoModel.conhecimentoid,
					colaboradorid: conhecimentotecnicoModel.colaboradorid,
					descricaoconhecimento: conhecimentotecnicoModel.descricaoconhecimento,
					nivelconhecimento: conhecimentotecnicoModel.nivelconhecimento,
					dataavaliacao: conhecimentotecnicoModel.dataavaliacao,
				)
			);
		}
		return resultList;
	}

	engajamentoproatividadeModelListClone(List<EngajamentoproatividadeModel> engajamentoproatividadeModelList) { 
		List<EngajamentoproatividadeModel> resultList = [];
		for (var engajamentoproatividadeModel in engajamentoproatividadeModelList) {
			resultList.add(
				EngajamentoproatividadeModel(
					engajamentoid: engajamentoproatividadeModel.engajamentoid,
					colaboradorid: engajamentoproatividadeModel.colaboradorid,
					pontuacaoengajamento: engajamentoproatividadeModel.pontuacaoengajamento,
					dataavaliacao: engajamentoproatividadeModel.dataavaliacao,
					propostasmelhoria : engajamentoproatividadeModel.propostasmelhoria ,
				)
			);
		}
		return resultList;
	}

	capacidadecomunicacaoModelListClone(List<CapacidadecomunicacaoModel> capacidadecomunicacaoModelList) { 
		List<CapacidadecomunicacaoModel> resultList = [];
		for (var capacidadecomunicacaoModel in capacidadecomunicacaoModelList) {
			resultList.add(
				CapacidadecomunicacaoModel(
					comunicacaoid: capacidadecomunicacaoModel.comunicacaoid,
					colaboradorid: capacidadecomunicacaoModel.colaboradorid,
					avaliacaocomunicacao: capacidadecomunicacaoModel.avaliacaocomunicacao,
					feedbackcomunicacao: capacidadecomunicacaoModel.feedbackcomunicacao,
					dataavaliacao: capacidadecomunicacaoModel.dataavaliacao,
				)
			);
		}
		return resultList;
	}

	resultadosatingidosModelListClone(List<ResultadosatingidosModel> resultadosatingidosModelList) { 
		List<ResultadosatingidosModel> resultList = [];
		for (var resultadosatingidosModel in resultadosatingidosModelList) {
			resultList.add(
				ResultadosatingidosModel(
					resultadoid: resultadosatingidosModel.resultadoid,
					colaboradorid: resultadosatingidosModel.colaboradorid,
					metasatingidas: resultadosatingidosModel.metasatingidas,
					dataavaliacao: resultadosatingidosModel.dataavaliacao,
					pontuacaoprodutividade: resultadosatingidosModel.pontuacaoprodutividade,
					defeitosproduzidos: resultadosatingidosModel.defeitosproduzidos,
				)
			);
		}
		return resultList;
	}

	capacitacaotreinamentosModelListClone(List<CapacitacaotreinamentosModel> capacitacaotreinamentosModelList) { 
		List<CapacitacaotreinamentosModel> resultList = [];
		for (var capacitacaotreinamentosModel in capacitacaotreinamentosModelList) {
			resultList.add(
				CapacitacaotreinamentosModel(
					treinamentoid: capacitacaotreinamentosModel.treinamentoid,
					colaboradorid: capacitacaotreinamentosModel.colaboradorid,
					nometreinamento: capacitacaotreinamentosModel.nometreinamento,
					dataconclusao: capacitacaotreinamentosModel.dataconclusao,
					certificado: capacitacaotreinamentosModel.certificado,
				)
			);
		}
		return resultList;
	}

	feedbacksupervisoresModelListClone(List<FeedbacksupervisoresModel> feedbacksupervisoresModelList) { 
		List<FeedbacksupervisoresModel> resultList = [];
		for (var feedbacksupervisoresModel in feedbacksupervisoresModelList) {
			resultList.add(
				FeedbacksupervisoresModel(
					feedbackid: feedbacksupervisoresModel.feedbackid,
					supervisoridSupervisores: feedbacksupervisoresModel.supervisoridSupervisores,
					colaboradorid: feedbacksupervisoresModel.colaboradorid,
					feedback: feedbacksupervisoresModel.feedback,
					datafeedback: feedbacksupervisoresModel.datafeedback,
				)
			);
		}
		return resultList;
	}

	resolucaoproblemasModelListClone(List<ResolucaoproblemasModel> resolucaoproblemasModelList) { 
		List<ResolucaoproblemasModel> resultList = [];
		for (var resolucaoproblemasModel in resolucaoproblemasModelList) {
			resultList.add(
				ResolucaoproblemasModel(
					resolucaoid: resolucaoproblemasModel.resolucaoid,
					colaboradorid: resolucaoproblemasModel.colaboradorid,
					descricaoproblemaresolvido: resolucaoproblemasModel.descricaoproblemaresolvido,
					dataresolucao: resolucaoproblemasModel.dataresolucao,
					avaliacaoresolucao: resolucaoproblemasModel.avaliacaoresolucao,
				)
			);
		}
		return resultList;
	}

	assiduidadepontualidadeModelListClone(List<AssiduidadepontualidadeModel> assiduidadepontualidadeModelList) { 
		List<AssiduidadepontualidadeModel> resultList = [];
		for (var assiduidadepontualidadeModel in assiduidadepontualidadeModelList) {
			resultList.add(
				AssiduidadepontualidadeModel(
					assiduidadeid: assiduidadepontualidadeModel.assiduidadeid,
					colaboradorid: assiduidadepontualidadeModel.colaboradorid,
					faltasinjustificadas: assiduidadepontualidadeModel.faltasinjustificadas,
					atrasos: assiduidadepontualidadeModel.atrasos,
					dataregistro: assiduidadepontualidadeModel.dataregistro,
				)
			);
		}
		return resultList;
	}

	
}