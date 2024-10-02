import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:integre_plus_action_renault/app/page/trilha/custom_background.dart';
import 'package:integre_plus_action_renault/app/page/trilha/gradiente_app.dart';
import 'package:integre_plus_action_renault/app/page/trilha/menu_interno_botoes.dart';
import 'package:integre_plus_action_renault/app/page/trilha/menu_titulo_grupo_menu_interno.dart';
import 'package:integre_plus_action_renault/app/page/trilha/profile_tile.dart';
import 'package:integre_plus_action_renault/app/page/trilha/tree_view_page.dart';
import 'package:integre_plus_action_renault/app/page/trilha/trilha_operador_page.dart';

class MenuTilhaWidget extends StatelessWidget {
  const MenuTilhaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem-vindo a trilha',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: gradienteApp(context),
          ),
        ),
      ),
      backgroundColor: secondaryHeaderColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CustomBackground(
            showIcon: false,
          ),
          allCards(context),
        ],
      ),
    );
  }

  Widget allCards(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            const SizedBox(
              height: 10,
            ),
            actionMenuCadastroGerais(context),
            const SizedBox(
              height: 10,
            ),
            const TreeViewPage()
          ],
        ),
      ),
    );
  }

  Widget appBarColumn(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
        child: Container(
          color: primaryColor,
          child: const Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ProfileTile(
                    title: 'TalentForge',
                    subtitle: "Módulo de preparação",
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionMenuCadastroGerais(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const MenuTituloGrupoMenuInterno(titulo: "Trilhas"),
                  MenuInternoBotoes(
                    primeiroBotao: BotaoMenu(
                        icon: FontAwesomeIcons.streetView,
                        label: "Trilha do líder",
                        circleColor: Colors.orange,
                        rota: "/trilha_lider"),
                    segundoBotao: BotaoMenu(
                        // ignore: deprecated_member_use
                        icon: Icons.streetview,
                        label: "Trilha do operador",
                        circleColor: Colors.teal,
                        onPressed: () => showDialogOperador(context)),
                    terceiroBotao: null,
                    quartoBotao: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Future<bool?> showDialogOperador(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return showDialog(
        context: context,
        barrierColor: Colors.black12.withOpacity(0.6), // Background color
        barrierDismissible: true,
        useSafeArea: false,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: primaryColor,
                        child: const Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ProfileTile(
                                  title: 'TalentForge',
                                  subtitle: "Trilha do operador",
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 55),
                        child: Center(child: TrilhaOperadorPage()),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
