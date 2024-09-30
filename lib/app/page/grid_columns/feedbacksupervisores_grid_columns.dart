import 'package:pluto_grid/pluto_grid.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';

List<PlutoColumn> feedbacksupervisoresGridColumns({bool isForLookup = false}) {
  return <PlutoColumn>[
    PlutoColumn(
      title: "Feedbackid",
      field: "feedbackid",
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
      title: "Supervisorid Supervisores",
      field: "supervisores",
      type: PlutoColumnType.text(),
      formatter: Util.stringFormat,
      enableFilterMenuItem: true,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.left,
      width: 400,
      hide: isForLookup,
    ),
    PlutoColumn(
      title: "Feedback",
      field: "feedback",
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
      title: "Supervisorid Supervisores",
      field: "supervisoridSupervisores",
      type: PlutoColumnType.number(),
      enableFilterMenuItem: false,
      enableSetColumnsMenuItem: false,
      enableHideColumnMenuItem: false,
      titleTextAlign: PlutoColumnTextAlign.center,
      textAlign: PlutoColumnTextAlign.center,
      width: 200,
      hide: true,
    ),
  ];
}
