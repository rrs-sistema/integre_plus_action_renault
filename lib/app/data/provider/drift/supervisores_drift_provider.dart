import 'package:integre_plus_action_renault/app/data/provider/drift/database/database_imports.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/data/provider/provider_base.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/database/database.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';

class SupervisoresDriftProvider extends ProviderBase {

	Future<List<SupervisoresModel>?> getList({Filter? filter}) async {
		List<SupervisoresGrouped> supervisoresDriftList = [];

		try {
			if (filter != null && filter.field != null) {
				supervisoresDriftList = await Session.database.supervisoresDao.getGroupedList(field: filter.field, value: filter.value!);
			} else {
				supervisoresDriftList = await Session.database.supervisoresDao.getGroupedList(); 
			}
			if (supervisoresDriftList.isNotEmpty) {
				return toListModel(supervisoresDriftList);
			} else {
				return [];
			}			 
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
			return null;
		}
	}

	Future<SupervisoresModel?> getObject(dynamic pk) async {
		try {
			final result = await Session.database.supervisoresDao.getObjectGrouped(field: 'supervisorid', value: pk);
			return toModel(result);
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<SupervisoresModel?>? insert(SupervisoresModel supervisoresModel) async {
		try {
			final lastPk = await Session.database.supervisoresDao.insertObject(toDrift(supervisoresModel));
			supervisoresModel.supervisorid = lastPk;
			return supervisoresModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<SupervisoresModel?>? update(SupervisoresModel supervisoresModel) async {
		try {
			await Session.database.supervisoresDao.updateObject(toDrift(supervisoresModel));
			return supervisoresModel;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}

	Future<bool?> delete(dynamic pk) async {
		try {
			await Session.database.supervisoresDao.deleteObject(toDrift(SupervisoresModel(supervisorid: pk)));
			return true;
		} on Exception catch (e) {
			handleResultError(null, null, exception: e);
		}
		return null;
	}	

	List<SupervisoresModel> toListModel(List<SupervisoresGrouped> supervisoresDriftList) {
		List<SupervisoresModel> listModel = [];
		for (var supervisoresDrift in supervisoresDriftList) {
			listModel.add(toModel(supervisoresDrift)!);
		}
		return listModel;
	}	

	SupervisoresModel? toModel(SupervisoresGrouped? supervisoresDrift) {
		if (supervisoresDrift != null) {
			return SupervisoresModel(
				supervisorid: supervisoresDrift.supervisores?.supervisorid,
				nome: supervisoresDrift.supervisores?.nome,
				cargo: supervisoresDrift.supervisores?.cargo,
				email: supervisoresDrift.supervisores?.email,
				telefone: supervisoresDrift.supervisores?.telefone,
				dataadmissao: supervisoresDrift.supervisores?.dataadmissao,
				status: supervisoresDrift.supervisores?.status,
			);
		} else {
			return null;
		}
	}


	SupervisoresGrouped toDrift(SupervisoresModel supervisoresModel) {
		return SupervisoresGrouped(
			supervisores: Supervisores(
				supervisorid: supervisoresModel.supervisorid,
				nome: supervisoresModel.nome,
				cargo: supervisoresModel.cargo,
				email: supervisoresModel.email,
				telefone: supervisoresModel.telefone,
				dataadmissao: supervisoresModel.dataadmissao,
				status: supervisoresModel.status,
			),
		);
	}

		
}
