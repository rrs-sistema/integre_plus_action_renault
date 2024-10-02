import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';

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
    final node2 = Node.Id("1: Experiência");
    final node3 = Node.Id("2: Tomada de decisão");
    final node4 = Node.Id("3: Delegar tarefas");
    final node5 = Node.Id("4: Visão estratégica");

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.blue);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node5, paint: Paint()..color = Colors.red);

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
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
            .nextInt(27);
            if (titulo.contains(':')) {
              var indexString = titulo.substring(0, titulo.indexOf(':'));
              print('index ==>>> $indexString');
              index = random.nextInt(25);
            }

            return rectangleWidget(titulo, index);
          },
        ),
      ),
    );
  }
}
