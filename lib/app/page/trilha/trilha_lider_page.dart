import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';
import 'package:integre_plus_action_renault/app/infra/util.dart';

class TrilhaLiderPage extends StatefulWidget {
  const TrilhaLiderPage({super.key});

  @override
  State<TrilhaLiderPage> createState() => _TrilhaLiderPageState();
}

class _TrilhaLiderPageState extends State<TrilhaLiderPage> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  Random r = Random();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id("Líder");

    final node2 = Node.Id("1: Liderança nível básico");
    final node3 = Node.Id("2: Liderança nível médio");

    final node4 = Node.Id("3: Formação prática C-Level");

    //final node5 = Node.Id("4: Visão estratégica");
    final node2_1 = Node.Id("1.1: Mentalidade de liderança e protagonismo");
    final node2_2 = Node.Id("1.2: Inteligência emocional, gestão de conflitos e influência");
    final node2_3 = Node.Id("1.3: Comunicação assertiva com times e pares");
    final node2_4 = Node.Id("1.4: Formação de times de alta performance");
    final node2_5 = Node.Id("1.5: Delegação, engajamento e direcionamento para resultados");
    final node2_6 = Node.Id("1.6: Como dar e receber feedbacks");
    final node2_7 =
        Node.Id("1.7: Boas práticas de gestão de pessoas inivação e transformação digitais");

    final node3_1 = Node.Id("2.1: Mentalidade de liderança e protagonismo");
    final node3_2 = Node.Id("2.2: Inteligência emocional, gestão de conflitos e influência");
    final node3_3 = Node.Id("2.3: Comunicação assertiva com times e pares");
    final node3_4 = Node.Id("2.4: Formação de times de alta performance");
    final node3_5 = Node.Id("2.5: Delegação, engajamento e direcionamento para resultados");
    final node3_6 = Node.Id("2.6: Como dar e receber feedbacks");
    final node3_7 =
        Node.Id("2.7: Boas práticas de gestão de pessoas inivação e transformação digitais");

    final node4_1 = Node.Id("3.1: Cenários de inivação para alta liderança");
    final node4_2 = Node.Id("3.2: Estratégia ágil e indicadores");
    final node4_3 = Node.Id("3.3: Cultura para empresa e lideranças de alta performance");
    final node4_4 = Node.Id("3.4: Diversidade e inclusão: uma visão estratégica");
    final node4_5 = Node.Id("3.5: Oratória, comunicação e negociação para grandes lideres");
    final node4_6 = Node.Id("3.6: Direcionamento e comunicação da estratégia");
    final node4_7 = Node.Id("2.7: Gerenciamento de demandas com equilibrio e alta perfomance");
    final node4_8 =
        Node.Id("2.8: Desenvolver talentos e novas lideranças alinhadas á cultura da empresa.");

    graph.addEdge(node1, node2);
    //graph.addEdge(node1, node1_1);
    //graph.addEdge(node1, node1_2);
    //graph.addEdge(node1, node1_3);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.blue);
    //graph.addEdge(node1, nodeTraco3_1);
    //graph.addEdge(node1, nodeTraco3_2);
    //graph.addEdge(node1, nodeTraco3_3);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.red);
    //graph.addEdge(node1, nodeTraco4_1);
    //graph.addEdge(node1, nodeTraco4_2);
    //graph.addEdge(node1, nodeTraco4_3);
    //graph.addEdge(node1, node5, paint: Paint()..color = Colors.red);

    graph.addEdge(node2, node2_1, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_1, node2_2, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_2, node2_3, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_3, node2_4, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_4, node2_5, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_5, node2_6, paint: Paint()..color = Colors.red);
    graph.addEdge(node2_6, node2_7, paint: Paint()..color = Colors.red);

    graph.addEdge(node3, node3_1, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_1, node3_2, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_2, node3_3, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_3, node3_4, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_4, node3_5, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_5, node3_6, paint: Paint()..color = Colors.black);
    graph.addEdge(node3_6, node3_7, paint: Paint()..color = Colors.black);

    graph.addEdge(node4, node4_1, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_1, node4_2, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_2, node4_3, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_3, node4_4, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_4, node4_5, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_5, node4_6, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_6, node4_7, paint: Paint()..color = Colors.black);
    graph.addEdge(node4_7, node4_8, paint: Paint()..color = Colors.black);

    builder
        // ..siblingSeparation = (100)
        // ..levelSeparation = (315)
        // ..subtreeSeparation = (250)
        .orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    //..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    //..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);
  }

  Widget rectangleWidget(String titulo, int index) {
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('clicked == $titulo');
        }
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: index == 0
                      ? getColor(27)
                      : index > 1
                          ? getColor(index)
                          : Colors.blue[300]!,
                  spreadRadius: 0.1),
            ],
          ),
          child: Text(
            titulo,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var telaPequena = Util.isTelaPequena(context)!;

    if (!telaPequena) {
      builder
        ..siblingSeparation = (45)
        ..levelSeparation = (45)
        ..subtreeSeparation = (5)
        ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
    }

    return SizedBox(
      height: height - 260,
      child: InteractiveViewer(
        constrained: false,
        boundaryMargin: const EdgeInsets.all(50),
        minScale: 0.01,
        maxScale: 4.6,
        child: GraphView(
          graph: graph,
          algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
          paint: Paint()
            ..color = Colors.green
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
          builder: (Node node) {
            // I can decide what widget should be shown here based on the id
            var titulo = node.key!.value! as String;
            int index = 0;
            Random random = Random();
            if (titulo.contains(':')) {
              var indexString = titulo.substring(0, titulo.indexOf(':'));
              if (kDebugMode) {
                print('index ==>>> $indexString');
              }
              if (indexString.length == 1) {
                index = 0;
              } else {
                index = random.nextInt(25);
              }
            }

            return rectangleWidget(titulo, index);
          },
        ),
      ),
    );
  }
}
