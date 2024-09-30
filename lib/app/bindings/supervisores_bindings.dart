import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/supervisores_controller.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/supervisores_drift_provider.dart';
import 'package:integre_plus_action_renault/app/data/repository/supervisores_repository.dart';

class SupervisoresBindings implements Binding {
	@override
	List<Bind> dependencies() {
		return [
			Bind.lazyPut<SupervisoresController>(() => SupervisoresController(
					supervisoresRepository:
							SupervisoresRepository(supervisoresDriftProvider: SupervisoresDriftProvider()))),
		];
	}
}
