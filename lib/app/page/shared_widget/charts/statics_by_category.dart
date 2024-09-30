import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/colaboradores_controller.dart';
import 'package:integre_plus_action_renault/app/controller/theme_controller.dart';
import 'package:integre_plus_action_renault/app/data/dto/dto.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/charts/expense_widget.dart';

class StaticsByCategory extends StatefulWidget {
  const StaticsByCategory({Key? key}) : super(key: key);

  @override
  State<StaticsByCategory> createState() => _StaticsByCategoryState();
}

class _StaticsByCategoryState extends State<StaticsByCategory> {
  int touchedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  final themeController = Get.find<ThemeController>();
  final colaboradoresController = Get.find<ColaboradoresController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 250,
            width: 300,
            child: _pieChart(
              colaboradoresController.conhecimentoTecnicoStream
                  .map(
                    (e) => ConhecimentoTecnicoDto(
                      index: e.index,
                      nivelConhecimento: e.nivelConhecimento,
                      totalColaboradorPorNivel: e.totalColaboradorPorNivel,
                      mediaNivelConhecimento: e.mediaNivelConhecimento,
                      percentualColaborador: e.percentualColaborador,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: _otherExpanses(colaboradoresController.conhecimentoTecnicoStream),
        ),
      ],
    );
  }

  Widget _otherExpanses(List<ConhecimentoTecnicoDto> otherExpenses) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(2),
        children:
            otherExpenses.map((ConhecimentoTecnicoDto e) => ExpenseWidget(expense: e)).toList(),
      ),
    );
  }

  Widget _pieChart(List<ConhecimentoTecnicoDto> data) {
    final totalCola = data.fold(0, (sum, item) => sum + item.totalColaboradorPorNivel!);
    return Obx(() => SizedBox(
          height: 280,
          width: 350,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  touchedIndex == -1
                      ? "$totalCola - Colaboradores"
                      : "${data[touchedIndex].totalColaboradorPorNivel}  - Colaboradores",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeController.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              PieChart(
                PieChartData(
                  sections: data
                      .map(
                        (e) => PieChartSectionData(
                          color: getColor(e.index!),
                          value: e.percentualColaborador,
                          radius: touchedIndex == data.indexOf(e) ? 35.0 : 25.0,
                          title: '',
                        ),
                      )
                      .toList(),
                  pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 90,
                ),
                swapAnimationDuration: const Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ],
          ),
        ));
  }
}
