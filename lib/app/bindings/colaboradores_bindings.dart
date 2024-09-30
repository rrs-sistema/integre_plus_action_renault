import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/colaboradores_controller.dart';
import 'package:integre_plus_action_renault/app/data/provider/drift/colaboradores_drift_provider.dart';
import 'package:integre_plus_action_renault/app/data/repository/colaboradores_repository.dart';

class ColaboradoresBindings implements Binding {
	@override
	List<Bind> dependencies() {
		return [
			Bind.lazyPut<ColaboradoresController>(() => ColaboradoresController(
					colaboradoresRepository:
							ColaboradoresRepository(colaboradoresDriftProvider: ColaboradoresDriftProvider()))),
		];
	}
}
