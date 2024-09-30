import 'package:pluto_grid/pluto_grid.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';

List<PlutoColumn> capacidadecomunicacaoGridColumns({bool isForLookup = false}) {
  return <PlutoColumn>[
    PlutoColumn(
      title: "Comunicacaoid",
      field: "comunicacaoid",
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
      title: "Avaliação comunicação",
      field: "avaliacaocomunicacao",
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
      title: "Feedback comunicação",
      field: "feedbackcomunicacao",
      type: PlutoColumnType.text(),
      formatter: Util.stringFormat,
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.left,
      width: 280,
    ),
  ];
}
