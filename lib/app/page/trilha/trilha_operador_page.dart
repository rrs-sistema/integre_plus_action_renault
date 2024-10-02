import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';

class TrilhaOperadorPage extends StatefulWidget {
  const TrilhaOperadorPage({super.key});

  @override
  State<TrilhaOperadorPage> createState() => _TrilhaOperadorPageState();
}

class _TrilhaOperadorPageState extends State<TrilhaOperadorPage> {
  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  Random r = Random();

  @override
  void initState() {
    super.initState();
    final node1 = Node.Id("Operador");
    final node2 = Node.Id("1: Conhecimento técnico");
    final node3 = Node.Id("2: Aptidão para liderança");
    final node4 = Node.Id("3: Resolução de problemas");
    final node5 = Node.Id("4: Capacitação de comunicação");
    final node6 = Node.Id("5: Engajamento e proatividade");

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.blue);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    graph.addEdge(node1, node5, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node6, paint: Paint()..color = Colors.red);

    builder
      ..siblingSeparation = (15)
      ..levelSeparation = (45)
      ..subtreeSeparation = (10)
//      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM);
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);
  }

  Widget rectangleWidget(String titulo, int index) {
    return InkWell(
      onTap: () {
        print('clicked == $titulo');
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: index > 0 ? getColor(index) : Colors.blue[300]!, spreadRadius: 0.1),
            ],
          ),
          child: Text(
            titulo,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height - 260,
      child: InteractiveViewer(
        constrained: false,
        boundaryMargin: const EdgeInsets.all(5),
        minScale: 0.01,
        maxScale: 1.6,
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
            if (titulo.contains(':')) {
              var indexString = titulo.substring(0, titulo.indexOf(':'));
              index = int.parse(indexString);
            }

            return rectangleWidget(titulo, index);
          },
        ),
      ),
    );
  }
}
