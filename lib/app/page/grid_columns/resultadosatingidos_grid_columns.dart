import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> resultadosatingidosGridColumns({bool isForLookup = false}) {
  return <PlutoColumn>[
    PlutoColumn(
      title: "Resultadoid",
      field: "resultadoid",
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
      title: "Metas atingidas",
      field: "metasatingidas",
      type: PlutoColumnType.number(
        format: '##########',
      ),
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 180,
    ),
    PlutoColumn(
      title: "Pontuação produtividade",
      field: "pontuacaoprodutividade",
      type: PlutoColumnType.number(
        format: '##########',
      ),
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 260,
    ),
    PlutoColumn(
      title: "Defeitos produzidos",
      field: "defeitosproduzidos",
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
