import 'package:flutter/material.dart';
import 'package:integre_plus_action_renault/app/page/trilha/arc_clipper.dart';
import 'package:integre_plus_action_renault/app/page/trilha/view_util_lib.dart';

class CustomBackground extends StatelessWidget {
  final bool showIcon;
  final String? image;
  CustomBackground({Key? key, this.showIcon = true, this.image}) : super(key: key);

  Widget topHalf(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 2,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: ViewUtilLib.kitGradients,
              )),
            ),
            showIcon
                ? Center(
                    child: SizedBox(
                      height: deviceSize.height / 8,
                      width: deviceSize.width / 2,
                      child: Image.asset(
                        'assets/icons/slogan.jpg',
                      ),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: image != null
                        ? Image.network(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : Container())
          ],
        ),
      ),
    );
  }

  final bottomHalf = Flexible(
    flex: 3,
    child: Container(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[topHalf(context), bottomHalf],
    );
  }
}
