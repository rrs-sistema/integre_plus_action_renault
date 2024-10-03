import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/page/trilha/menu_tilha_widget.dart';
import 'package:integre_plus_action_renault/app/page/trilha/trilha_lider_melhorada_page.dart';
import 'package:integre_plus_action_renault/app/routes/app_routes.dart';
import 'package:integre_plus_action_renault/app/page/login/login_page.dart';
import 'package:integre_plus_action_renault/app/page/shared_page/splash_screen_page.dart';
import 'package:integre_plus_action_renault/app/bindings/bindings_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_page/shared_page_imports.dart';
import 'package:integre_plus_action_renault/app/page/page_imports.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.splashPage, page: () => const SplashScreenPage()),
    GetPage(name: Routes.loginPage, page: () => const LoginPage(), binding: LoginBindings()),
    GetPage(name: Routes.homePage, page: () => HomePage()),
    GetPage(name: Routes.trilhaPage, page: () => const LeadershipPathWidget()),
    GetPage(name: Routes.menuTilhaWidget, page: () => const MenuTilhaWidget()),
    GetPage(name: Routes.filterPage, page: () => const FilterPage()),
    GetPage(name: Routes.lookupPage, page: () => const LookupPage()),
    GetPage(
        name: Routes.colaboradoresListPage,
        page: () => const ColaboradoresListPage(),
        binding: ColaboradoresBindings()),
    GetPage(name: Routes.colaboradoresTabPage, page: () => ColaboradoresTabPage()),
    GetPage(
        name: Routes.supervisoresListPage,
        page: () => const SupervisoresListPage(),
        binding: SupervisoresBindings()),
    GetPage(name: Routes.supervisoresEditPage, page: () => SupervisoresEditPage()),
  ];
}
