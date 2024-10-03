// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class LeadershipPathWidget extends StatefulWidget {
  const LeadershipPathWidget({super.key});

  @override
  _LeadershipPathWidgetState createState() => _LeadershipPathWidgetState();
}

class _LeadershipPathWidgetState extends State<LeadershipPathWidget> {
  bool _isExpandedExperience = false;
  bool _isExpandedDecisionMaking = false;
  bool _isExpandedTaskDelegation = false;
  bool _isExpandedStrategicVision = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 500),
              painter: PathPainter(
                isExpandedExperience: _isExpandedExperience,
                isExpandedDecisionMaking: _isExpandedDecisionMaking,
                isExpandedTaskDelegation: _isExpandedTaskDelegation,
                isExpandedStrategicVision: _isExpandedStrategicVision,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 50),
                  Center(
                    child: CircularNodeWidget(
                      label: 'Trilha do líder',
                      color: Colors.blue[300]!,
                      onTap: () {
                        setState(() {
                          _isExpandedExperience = false;
                          _isExpandedDecisionMaking = false;
                          _isExpandedTaskDelegation = false;
                          _isExpandedStrategicVision = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircularNodeWidget(
                        label: '1: Liderança nível básico"',
                        color: Colors.orange[400]!,
                        onTap: () {
                          setState(() {
                            _isExpandedExperience = !_isExpandedExperience;
                          });
                        },
                      ),
                      CircularNodeWidget(
                        label: '2: Liderança nível médio',
                        color: Colors.green[400]!,
                        onTap: () {
                          setState(() {
                            _isExpandedDecisionMaking = !_isExpandedDecisionMaking;
                          });
                        },
                      ),
                      CircularNodeWidget(
                        label: '3: Formação prática C-Level',
                        color: Colors.red[400]!,
                        onTap: () {
                          setState(() {
                            _isExpandedTaskDelegation = !_isExpandedTaskDelegation;
                          });
                        },
                      ),
                      // CircularNodeWidget(
                      //   label: '4: Visão estratégica',
                      //   color: Colors.blue[800]!,
                      //   onTap: () {
                      //     setState(() {
                      //       _isExpandedStrategicVision = !_isExpandedStrategicVision;
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (_isExpandedExperience)
                    const SubNodesWidget(subNodes: [
                      '1.1: Mentalidade de liderança e protagonismo',
                      '1.2: Inteligência emocional, gestão de conflitos e influência',
                      '1.3: Comunicação assertiva com times e pares',
                      '1.4: Formação de times de alta performance',
                      '1.5: Delegação, engajamento e direcionamento para resultados',
                      '1.6: Como dar e receber feedbacks',
                      '1.7: Boas práticas de gestão de pessoas inivação e transformação digitais'
                    ]),
                  if (_isExpandedDecisionMaking)
                    const SubNodesWidget(subNodes: [
                      '2.1: Mentalidade de liderança e protagonismo',
                      '2.2: Inteligência emocional, gestão de conflitos e influência',
                      '2.3: Comunicação assertiva com times e pares',
                      '2.4: Formação de times de alta performance',
                      '2.5: Delegação, engajamento e direcionamento para resultados',
                      '2.6: Como dar e receber feedbacks',
                      '2.7: Boas práticas de gestão de pessoas inivação e transformação digitais'
                    ]),
                  if (_isExpandedTaskDelegation)
                    const SubNodesWidget(subNodes: [
                      '3.1: Cenários de inivação para alta liderança',
                      '3.2: Estratégia ágil e indicadores',
                      '3.3: Cultura para empresa e lideranças de alta performance',
                      '3.4: Diversidade e inclusão: uma visão estratégica',
                      '3.5: Oratória, comunicação e negociação para grandes lideres',
                      '3.6: Direcionamento e comunicação da estratégia',
                      '2.7: Gerenciamento de demandas com equilibrio e alta perfomance',
                      '2.8: Desenvolver talentos e novas lideranças alinhadas á cultura da empresa.'
                    ]),
                  // if (_isExpandedStrategicVision)
                  //   SubNodesWidget(subNodes: const [
                  //     'Long-term Goals',
                  //     'Innovation',
                  //   ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomPainter to draw smooth lines between nodes
class PathPainter extends CustomPainter {
  final bool isExpandedExperience;
  final bool isExpandedDecisionMaking;
  final bool isExpandedTaskDelegation;
  final bool isExpandedStrategicVision;

  PathPainter({
    required this.isExpandedExperience,
    required this.isExpandedDecisionMaking,
    required this.isExpandedTaskDelegation,
    required this.isExpandedStrategicVision,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final startX = size.width / 2;
    const startY = 50.0;
    const endY = 160.0;

    // Leader to Experience line
    path.moveTo(startX, startY);
    path.quadraticBezierTo(startX - 150, (startY + endY) / 2, startX - 150, endY);

    // Leader to Decision Making line
    path.moveTo(startX, startY);
    path.quadraticBezierTo(startX, (startY + endY) / 2, startX, endY);

    // Leader to Task Delegation line
    path.moveTo(startX, startY);
    path.quadraticBezierTo(startX + 150, (startY + endY) / 2, startX + 150, endY);

    // Leader to Strategic Vision line
    // path.moveTo(startX, startY);
    // path.quadraticBezierTo(startX + 300, (startY + endY) / 2, startX + 300, endY);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// Circular node with interactivity
class CircularNodeWidget extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const CircularNodeWidget(
      {super.key, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// Sub-nodes that expand under the main nodes
class SubNodesWidget extends StatelessWidget {
  final List<String> subNodes;

  const SubNodesWidget({super.key, required this.subNodes});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
          children: subNodes.map((subNode) {
        index++;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.grey[200] : Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              subNode,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        );
      }).toList()),
    );
  }
}
