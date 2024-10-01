import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/controller_imports.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';
import 'package:integre_plus_action_renault/app/infra/constants.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';
import 'package:integre_plus_action_renault/app/page/cards/card_dashboard.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/charts/statics_by_category.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/indicator.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/input/custom_dropdown_button_form_field.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/main_side_drawer.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

class HomePage extends GetView<ColaboradoresController> {
  HomePage({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();
  final colaboradoresController = Get.find<ColaboradoresController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(
              Constants.appName,
              style: TextStyle(
                color: themeController.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: !themeController.isDarkMode ? Colors.grey[400]! : Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  themeController.isDarkMode
                      ? themeController.changeThemeMode(ThemeMode.light)
                      : themeController.changeThemeMode(ThemeMode.dark);
                },
                icon: themeController.isDarkMode
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
              ),
            ],
          ),
          drawer: MainSideDrawer(),
          body: Obx(
            () {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      // begin: Alignment.topLeft,
                      // end: Alignment.bottomRight,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      //stops: const [0.1, 0.4, 0.7, 0.9],
                      stops: const [0.1, 0.4, 0.7, 0.9],
                      colors: themeController.isDarkMode
                          ? [
                              Colors.blueGrey.shade900,
                              Colors.green.shade900,
                              Colors.grey.shade900,
                              Colors.blue.shade900,
                            ]
                          : [
                              Colors.grey[400]!, // Cinza claro
                              Colors.grey[500]!, // Cinza claro
                              Colors.grey,
                              Colors.blueGrey[100]!, // Cinza claro
                              // Colors.blueGrey.shade100,
                              // Colors.green,
                              // Colors.grey,
                              // Colors.blue.shade100,
                            ]),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.0), BlendMode.dstATop),
                    image: Image.asset(
                      Constants.backgroundImage,
                      color: Colors.grey[300],
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
                            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                            children: <Widget>[
                              const Divider(
                                color: Colors.transparent,
                              ),
                              BootstrapRow(children: <BootstrapCol>[
                                BootstrapCol(
                                  sizes: 'col-12',
                                  child: Padding(
                                    padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                    child: CustomDropdownButtonFormField(
                                      value: colaboradoresController
                                          .pontuacaoColaboradorStream[0].nome!,
                                      labelText: 'Selecione o colaborador',
                                      hintText: 'Selecione o colaborador',
                                      fontColor:
                                          themeController.isDarkMode ? Colors.white : Colors.black,
                                      items: colaboradoresController.pontuacaoColaboradorStream
                                          .map((item) {
                                        return item.nome!;
                                      }).toList(),
                                      onChanged: (dynamic newValue) {
                                        int idCola = colaboradoresController.colaboradoresModelList
                                            .where((x) => x.nome == newValue)
                                            .first
                                            .colaboradorid!;
                                        colaboradoresController
                                            .getCombinacaoIndicadorestream(idCola);
                                        colaboradoresController.getMediaGeralStream(idCola);
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              BootstrapRow(children: <BootstrapCol>[
                                BootstrapCol(
                                  sizes: 'col-12',
                                  child: Padding(
                                    padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                    child: SpeedometerChart(
                                      animationDuration: 15000,
                                      minWidget: const Text(
                                        "Min: 0",
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                      maxWidget: const Text(
                                        "Max: 100",
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                      ),
                                      dimension: 200,
                                      value: colaboradoresController.mediaGeral,
                                      minValue: 0,
                                      maxValue: 100,
                                      title: const Text(
                                        'Velocímetro do engajamento',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      valueWidget: Text(
                                        colaboradoresController.mediaGeral.toStringAsFixed(2),
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      hasIconPointer: false,
                                      graphColor: const [Colors.red, Colors.yellow, Colors.green],
                                      pointerColor:
                                          themeController.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ]),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  'Pontuação gerais',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média nível conhecimento',
                                          iconPath: Constants.knowledge,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaNivelConhecimento!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média de engajamento',
                                          iconPath: Constants.engagement,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaEngajamento!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                ],
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média meta atingida',
                                          iconPath: Constants.goals,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaMetaAtingida!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média produtividade',
                                          iconPath: Constants.productivity,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaProdutividade!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                ],
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Percentual de treinamento',
                                          iconPath: Constants.training,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.percentualTreinamento!
                                              .toString()),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média de valiação qualitativa',
                                          iconPath: Constants.feedback,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaAvaliacaoQualitativa!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                ],
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média de falta injustificada',
                                          iconPath: Constants.absence,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaFaltaInjustificada!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média de atraso',
                                          iconPath: Constants.late,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaAtraso!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                ],
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Total de problema resolvido',
                                          iconPath: Constants.problemResolved,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.totalProblemaResolvido!
                                              .toString()),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: CardDashboard(
                                          title: 'Média de avaliação resolução',
                                          iconPath: Constants.resolution,
                                          value: colaboradoresController
                                              .pontuacaoGeralStream.mediaAvaliacaoResolucao!
                                              .toStringAsFixed(2)),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.transparent,
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: Util.isTelaPequena(context)! ? 'col-12' : 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: Card(
                                        elevation: 10,
                                        color: themeController.isDarkMode
                                            ? const Color.fromARGB(255, 171, 211, 250)
                                                .withOpacity(0.2)
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
                                    sizes: Util.isTelaPequena(context)! ? 'col-12' : 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: Card(
                                        elevation: 10,
                                        color: themeController.isDarkMode
                                            ? const Color.fromARGB(255, 171, 211, 250)
                                                .withOpacity(0.2)
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
                                    sizes: Util.isTelaPequena(context)! ? 'col-12' : 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: Card(
                                        elevation: 10,
                                        color: themeController.isDarkMode
                                            ? const Color.fromARGB(255, 171, 211, 250)
                                                .withOpacity(0.2)
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
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 60),
                                                      child: barChartAvaliacaoComunicacao(),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: colaboradoresController
                                                        .pontuacaoColaboradorStream
                                                        .map((item) {
                                                      return Indicator(
                                                        text: item.nome!
                                                            .substring(0, item.nome!.indexOf(' ')),
                                                        color: getColor(item.index!),
                                                        isSquare: true,
                                                      );
                                                    }).toList(),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  BootstrapCol(
                                    sizes: Util.isTelaPequena(context)! ? 'col-12' : 'col-6',
                                    child: Padding(
                                      padding: Util.distanceBetweenColumnsLineBreak(context)!,
                                      child: Card(
                                        elevation: 10,
                                        color: themeController.isDarkMode
                                            ? const Color.fromARGB(255, 171, 211, 250)
                                                .withOpacity(0.2)
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
                                                'Conhecimento Técnico',
                                                style: TextStyle(
                                                    fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top: 60),
                                                      child: barChartConhecimentoTecnico(),
                                                    ),
                                                  ),
                                                ],
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
        ));
  }

  SizedBox barChartConhecimentoTecnico() {
    return const SizedBox(
      height: 350,
      child: StaticsByCategory(),
    );
  }

  SizedBox barChartEngajamento() {
    return SizedBox(
      height: 350,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: colaboradoresController.pontuacaoColaboradorStream.map((item) {
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
          barGroups: colaboradoresController.pontuacaoColaboradorStream.map((item) {
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
          sections: colaboradoresController.pontuacaoColaboradorStream.map((item) {
            return PieChartSectionData(
              value: item.avaliacaoComunicacao!,
              title: '${item.pontuacaoEngajamento}%',
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
        String nome = colaboradoresController.pontuacaoColaboradorStream[value.toInt()].nome!;
        var date = value.toInt() < colaboradoresController.pontuacaoColaboradorStream.length
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
