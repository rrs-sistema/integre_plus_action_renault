import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integre_plus_action_renault/app/infra/infra_imports.dart';
import 'package:integre_plus_action_renault/app/page/login/login_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
    await Session.populateMainObjects();
    //Simulate other services for 3 seconds
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.blueGrey.shade400 : Colors.blueGrey.shade900),
                ),
                FittedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Constants.secondaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(25)),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Image.asset(
                          Constants.slogan,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const CircularProgressIndicator(),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'welcome_message'.tr,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
