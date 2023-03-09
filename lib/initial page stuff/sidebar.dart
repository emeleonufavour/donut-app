import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utilities.dart';

class DonutSideMenu extends StatelessWidget {
  const DonutSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Utils.mainDark,
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Image.network(Utils.donutLogoWhiteNoText),
          ),
          Image.network(
            Utils.donutLogoWhiteNoText,
            width: 100,
          ),
          Image.network(
            Utils.donutLogoWhiteText,
            width: 150,
          )
        ],
      ),
    );
  }
}
