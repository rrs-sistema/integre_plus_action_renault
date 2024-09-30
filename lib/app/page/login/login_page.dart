import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/controller/login_controller.dart';
import 'package:integre_plus_action_renault/app/page/login/widget/login_widget_imports.dart';
import 'package:integre_plus_action_renault/app/page/login/sign_up_page.dart';
import 'package:integre_plus_action_renault/app/routes/app_routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(scaffoldChildren: _scaffoldChildren());
  }

  List<Widget> _scaffoldChildren() {
    return [
      LoginCenterCard(centerCardChildren: _centerCardChildren()),
      const SizedBox(height: 10),
      ForgotPasswordButton(),
      const SizedBox(height: 10),
      LoginOuterCard(
        textLabel: 'login_dont_have_account'.tr,
        textButton: 'login_sign_up'.tr,
        function: () async {
          Get.to(() => SignupPage());
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
      LoginLabel(label: 'login_please_signin'.tr),
      const SizedBox(
        height: 20,
      ),
      LoginInputEmail(),
      const SizedBox(
        height: 20,
      ),
      LoginInputPassword(),
      const SizedBox(
        height: 20,
      ),
      LoginButton(text: 'login'.tr, function: () async {
				// TODO: modify it to get info about user and authenticate
        // await userController.getObject(email: controller.emailController.text, password: controller.passwordController.text);
				// or call doLogin() method from LoginController and insert something like the line above on it
        Get.offAndToNamed(Routes.homePage);
      }),
    ];
  }
}
