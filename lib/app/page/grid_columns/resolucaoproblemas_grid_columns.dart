import 'package:pluto_grid/pluto_grid.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';

List<PlutoColumn> resolucaoproblemasGridColumns({bool isForLookup = false}) {
  return <PlutoColumn>[
    PlutoColumn(
      title: "Resolucaoid",
      field: "resolucaoid",
      type: PlutoColumnType.number(
        format: '##########',
      ),
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 100,
      hide: true,
    ),
    PlutoColumn(
      title: "Problema resolvido",
      field: "descricaoproblemaresolvido",
      type: PlutoColumnType.text(),
      formatter: Util.stringFormat,
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.left,
      width: 400,
    ),
    PlutoColumn(
      title: "Data resolução",
      field: "dataresolucao",
      type: PlutoColumnType.date(format: "dd/MM/yyyy"),
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 200,
    ),
    PlutoColumn(
      title: "Avaliação resolução",
      field: "avaliacaoresolucao",
      type: PlutoColumnType.number(
        format: '##########',
      ),
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 220,
    ),
  ];
}
