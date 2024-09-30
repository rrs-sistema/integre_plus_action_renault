import 'package:pluto_grid/pluto_grid.dart';

List<PlutoColumn> engajamentoproatividadeGridColumns({bool isForLookup = false}) {
  return <PlutoColumn>[
    PlutoColumn(
      title: "Engajamentoid",
      field: "engajamentoid",
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
      title: "Pontuação engajamento",
      field: "pontuacaoengajamento",
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
    PlutoColumn(
      title: "Propostas melhoria",
      field: "propostasmelhoria ",
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
