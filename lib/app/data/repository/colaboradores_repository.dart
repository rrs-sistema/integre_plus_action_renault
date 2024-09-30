import 'package:integre_plus_action_renault/app/data/provider/drift/colaboradores_drift_provider.dart';
import 'package:integre_plus_action_renault/app/data/model/model_imports.dart';

class ColaboradoresRepository {
  final ColaboradoresDriftProvider colaboradoresDriftProvider;

  ColaboradoresRepository({required this.colaboradoresDriftProvider});

  Future<Stream<List<Map<String, dynamic>>>> getFilteredStream() async {
    return await colaboradoresDriftProvider.getFilteredStream();
  }

  Future<Stream<List<Map<String, dynamic>>>> getConhecimentoTecnicoStream() async {
    return await colaboradoresDriftProvider.getConhecimentoTecnicoStream();
  }

  Future<Stream<List<Map<String, dynamic>>>> getCombinacaoIndicadorestream(
      int idColaborador) async {
    return await colaboradoresDriftProvider.getCombinacaoIndicadorestream(idColaborador);
  }

  Future getList({Filter? filter}) async {
    return await colaboradoresDriftProvider.getList(filter: filter);
  }

  Future<ColaboradoresModel?>? save({required ColaboradoresModel colaboradoresModel}) async {
    if (colaboradoresModel.colaboradorid! > 0) {
      return await colaboradoresDriftProvider.update(colaboradoresModel);
    } else {
      return await colaboradoresDriftProvider.insert(colaboradoresModel);
    }
  }

  Future<bool> delete({required int colaboradorid}) async {
    return await colaboradoresDriftProvider.delete(colaboradorid) ?? false;
  }
}
