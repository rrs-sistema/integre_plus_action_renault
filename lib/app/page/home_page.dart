import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/controller_imports.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';
import 'package:integre_plus_action_renault/app/infra/constants.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/main_side_drawer.dart';

class HomePage extends GetView<LoginController> {
  HomePage({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();
  final colaboradoresController = Get.find<ColaboradoresController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appName),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.isDarkMode
                    ? themeController.changeThemeMode(ThemeMode.light)
                    : themeController.changeThemeMode(ThemeMode.dark);
              },
              icon: themeController.isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
            ),
          ),
        ],
      ),
      drawer: MainSideDrawer(),
      body: Obx(
        () {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.1, 0.4, 0.7, 0.9],
                  colors: themeController.isDarkMode
                      ? [
                          Colors.blueGrey.shade900,
                          Colors.green.shade900,
                          Colors.grey.shade900,
                          Colors.blue.shade900,
                        ]
                      : [
                          Colors.blueGrey.shade100,
                          Colors.green,
                          Colors.grey,
                          Colors.blue.shade100,
                        ]),
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.2), BlendMode.dstATop),
                image: Image.asset(
                  Constants.backgroundImage,
                ).image,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BootstrapContainer(
                        fluid: true,
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        children: <Widget>[
                          const Divider(
                            color: Colors.transparent,
                          ),
                          BootstrapRow(
                            children: <BootstrapCol>[
                              BootstrapCol(
                                sizes: 'col-6',
                                child: Padding(
                                  padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                  child: Card(
                                    elevation: 10,
                                    color: themeController.isDarkMode
                                        ? const Color.fromARGB(255, 171, 211, 250).withOpacity(0.2)
                                        : Colors.blue.shade100.withOpacity(0.1),
                                    child: Container(
                                      width: 850,
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Pontuação de Produtividade',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 60),
                                            child: barChartPontuacaoProdutividade(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BootstrapCol(
                                sizes: 'col-6',
                                child: Padding(
                                  padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                  child: Card(
                                    elevation: 10,
                                    color: themeController.isDarkMode
                                        ? const Color.fromARGB(255, 171, 211, 250).withOpacity(0.2)
                                        : Colors.blue.shade100.withOpacity(0.1),
                                    child: Container(
                                      width: 850,
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Pontuação com Engajamento',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 60),
                                            child: barChartEngajamento(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.transparent,
                          ),
                          BootstrapRow(
                            height: 60,
                            children: <BootstrapCol>[
                              BootstrapCol(
                                sizes: 'col-6',
                                child: Padding(
                                  padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                  child: Card(
                                    elevation: 10,
                                    color: themeController.isDarkMode
                                        ? const Color.fromARGB(255, 171, 211, 250).withOpacity(0.2)
                                        : Colors.blue.shade100.withOpacity(0.1),
                                    child: Container(
                                      width: 850,
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Text(
                                            'Avaliação de Comunicação',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 60),
                                            child: barChartAvaliacaoComunicacao(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              BootstrapCol(
                                sizes: 'col-6',
                                child: Padding(
                                  padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                  child: Card(
                                    elevation: 10,
                                    color: themeController.isDarkMode
                                        ? const Color.fromARGB(255, 171, 211, 250).withOpacity(0.2)
                                        : Colors.blue.shade100.withOpacity(0.1),
                                    child: Container(
                                      width: 850,
                                      padding: const EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Outras Pontuações',
                                            style: TextStyle(
                                                fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox barChartEngajamento() {
    return SizedBox(
      height: 350,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: colaboradoresController.PontuacaoColaboradorStream.map((item) {
            return BarChartGroupData(
              x: item.index!,
              barRods: [
                BarChartRodData(
                  toY: item.pontuacaoEngajamento!,
                  color: getColor(item.index!),
                )
              ],
              showingTooltipIndicators: [0],
            );
          }).toList(),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: _bottomTitles(),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox barChartPontuacaoProdutividade() {
    var sizedBox = SizedBox(
      height: 350,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: colaboradoresController.PontuacaoColaboradorStream.map((item) {
            return BarChartGroupData(
              x: item.index!,
              barRods: [
                BarChartRodData(
                  toY: item.pontuacaoProdutividade!,
                  color: getColor(item.index!),
                  backDrawRodData: null,
                )
              ],
              showingTooltipIndicators: [0],
            );
          }).toList(),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: _bottomTitles(),
            ),
          ),
        ),
      ),
    );
    return sizedBox;
  }

  SizedBox barChartAvaliacaoComunicacao() {
    var sizedBox = SizedBox(
      height: 350,
      child: PieChart(
        PieChartData(
          sections: colaboradoresController.PontuacaoColaboradorStream.map((item) {
            return PieChartSectionData(
              value: item.avaliacaoComunicacao!,
              title: item.nome!.substring(0, item.nome!.indexOf(' ')),
              color: getColor(item.index!),
              radius: 100,
            );
          }).toList(),
        ),
      ),
    );
    return sizedBox;
  }

  SideTitles _bottomTitles() {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    );
    return SideTitles(
      showTitles: true,
      interval: 1,
      getTitlesWidget: (value, meta) {
        String nome = colaboradoresController.PontuacaoColaboradorStream[value.toInt()].nome!;
        var date = value.toInt() < colaboradoresController.PontuacaoColaboradorStream.length
            ? nome.substring(0, nome.indexOf(' '))
            : "";
        return SideTitleWidget(
            axisSide: meta.axisSide,
            child: Text(
              date,
              style: style,
            ));
      },
    );
  }
}
