import 'package:integre_plus_action_renault/app/data/provider/drift/supervisores_drift_provider.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';

class SupervisoresRepository {
  final SupervisoresDriftProvider supervisoresDriftProvider;

  SupervisoresRepository({required this.supervisoresDriftProvider});

  Future getList({Filter? filter}) async {
		return await supervisoresDriftProvider.getList(filter: filter);
  }

  Future<SupervisoresModel?>? save({required SupervisoresModel supervisoresModel}) async {
    if (supervisoresModel.supervisorid! > 0) {
			return await supervisoresDriftProvider.update(supervisoresModel);
    } else {
			return await supervisoresDriftProvider.insert(supervisoresModel);
    }   
  }

  Future<bool> delete({required int supervisorid}) async {
		return await supervisoresDriftProvider.delete(supervisorid) ?? false;
	}
}