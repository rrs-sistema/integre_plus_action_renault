import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:integre_plus_action_renault/app/controller/theme_controller.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';
import 'package:integre_plus_action_renault/app/routes/app_routes.dart';

class MainSideDrawer extends StatelessWidget {
  MainSideDrawer({Key? key}) : super(key: key);

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'name'.tr,
            ),
            accountEmail: const Text(
              'Email',
            ),
            currentAccountPicture: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (() {
                  showInfoSnackBar(message: 'drawer_message_change_image_profile'.tr);
                }),
                child: const CircleAvatar(
                  backgroundImage: AssetImage(Constants.profileImage),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'drawer_single_page'.tr,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0),
            ),
          ),
          ListTile(
            enabled: Session.loggedInUser.administrador == 'S'
                ? true
                : Session.accessControlList
                        .where(((t) => t.funcaoNome == 'supervisores'))
                        .toList()
                        .isNotEmpty
                    ? Session.accessControlList
                            .where(((t) => t.funcaoNome == 'supervisores'))
                            .toList()[0]
                            .habilitado ==
                        'S'
                    : false,
            onTap: () {
              Get.toNamed(Routes.supervisoresListPage);
            },
            title: const Text(
              'Supervisor',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              iconDataList[Random().nextInt(10)],
              color: iconColorList[Random().nextInt(10)],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              'drawer_master_page'.tr,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0),
            ),
          ),
          ListTile(
            enabled: Session.loggedInUser.administrador == 'S'
                ? true
                : Session.accessControlList
                        .where(((t) => t.funcaoNome == 'colaboradores'))
                        .toList()
                        .isNotEmpty
                    ? Session.accessControlList
                            .where(((t) => t.funcaoNome == 'colaboradores'))
                            .toList()[0]
                            .habilitado ==
                        'S'
                    : false,
            onTap: () {
              Get.toNamed(Routes.colaboradoresListPage);
            },
            title: const Text(
              'Colaboradores',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: Icon(
              iconDataList[Random().nextInt(10)],
              color: iconColorList[Random().nextInt(10)],
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Get.offAllNamed('/loginPage');
            },
            title: Text(
              "button_exit".tr,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
