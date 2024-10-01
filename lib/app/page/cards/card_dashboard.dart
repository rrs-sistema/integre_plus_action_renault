import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/theme_controller.dart';
import 'package:integre_plus_action_renault/app/infra/colors.dart';

class CardDashboard extends StatelessWidget {
  final String title;
  final String value;
  final String iconPath;
  final themeController = Get.find<ThemeController>();
  CardDashboard({super.key, required this.title, required this.value, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    var random = Random();

    return Obx(() => Card(
          elevation: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [getColor(random.nextInt(15)), getColor(random.nextInt(20))],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Adicionando o ícone na esquerda
                  Image.asset(
                    iconPath,
                    width: 40,
                    height: 40,
                    color: themeController.isDarkMode ? Colors.white : Colors.black,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(width: 16), // Espaço entre o ícone e o texto
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: themeController.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: themeController.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
