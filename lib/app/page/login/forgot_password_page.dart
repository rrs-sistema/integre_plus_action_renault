import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/login_controller.dart';
import 'package:integre_plus_action_renault/app/page/login/widget/login_widget_imports.dart';
import 'package:integre_plus_action_renault/app/page/shared_widget/message_dialog.dart';
import 'package:integre_plus_action_renault/app/routes/app_routes.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(scaffoldChildren: _scaffoldChildren());
  }

  List<Widget> _scaffoldChildren() {
    return [
      LoginCenterCard(centerCardChildren: _centerCardChildren()),
      const SizedBox(height: 20),
      LoginOuterCard(
        textLabel: 'login_want_try_again'.tr,
        textButton: 'login_sign_in'.tr,
        function: () async {
          Get.offNamed(Routes.loginPage);
        },
      ),
    ];
  }

  List<Widget> _centerCardChildren() {
    return [
      const LoginImage(),
      const SizedBox(
        height: 10,
      ),
      LoginLabel(label: 'login_forgot_label'.tr),
      const SizedBox(
        height: 20,
      ),
      LoginInputEmail(),
      const SizedBox(
        height: 25,
      ),
      LoginButton(
          text: 'login_button_continue'.tr,
          function: () async {
            showInfoSnackBar(message: 'login_forgot_simulate_message'.tr);
          }),
    ];
  }
}
