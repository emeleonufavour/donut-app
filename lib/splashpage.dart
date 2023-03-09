import 'package:donut_app/pages/initialpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'utilities.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeIn));

    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(
          seconds: 5,
        ), (() {
      Utils.mainAppNav.currentState!.pushReplacementNamed('/main');
    }));
    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotationTransition(
                turns: animationController!,
                child: Image.network(
                  Utils.donutLogoWhiteNoText,
                  width: 100,
                  height: 100,
                ),
              ),
              Image.network(
                Utils.donutLogoWhiteText,
                width: 100,
                height: 100,
              )
            ]),
      ),
    );
  }
}
