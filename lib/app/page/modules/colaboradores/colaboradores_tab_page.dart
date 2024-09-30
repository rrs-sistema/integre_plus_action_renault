import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/colaboradores_controller.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/shared_widget_imports.dart';

class ColaboradoresTabPage extends StatelessWidget {
  ColaboradoresTabPage({Key? key}) : super(key: key);
  final colaboradoresController = Get.find<ColaboradoresController>();

  @override
  Widget build(BuildContext context) {
		return KeyboardListener(
			autofocus: false,
			focusNode: FocusNode(),
			onKeyEvent: (event) {
				if (event.logicalKey == LogicalKeyboardKey.escape) {
          colaboradoresController.preventDataLoss();
        }
      },
      child: Scaffold(
        key: colaboradoresController.colaboradoresTabPageScaffoldKey,
        appBar: AppBar(automaticallyImplyLeading: false, title: Text('Colaboradores - ${'editing'.tr}'), actions: [
          saveButton(onPressed: colaboradoresController.save),
          cancelAndExitButton(onPressed: colaboradoresController.preventDataLoss),
        ]),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: TabBarView(
                  controller: colaboradoresController.tabController,
                  children: colaboradoresController.tabPages(),
                ),
              ),
              ButtonsTabBar(
                controller: colaboradoresController.tabController,
                onTap: colaboradoresController.tabChange,
                height: 40,
                elevation: 2,
                borderWidth: 0,
                backgroundColor: Colors.blueGrey,
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: colaboradoresController.tabItems,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
