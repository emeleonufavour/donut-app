import 'package:donut_app/services/bottomnav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../utilities.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Consumer<DonutBarSelectionService>(
        builder: (context, value, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.trip_origin,
                  color: value.tabSelection == 'main'
                      ? Utils.mainDark
                      : Utils.mainColor,
                ),
                onPressed: (() {
                  value.setTabSelection('main');
                }),
              ),
              IconButton(
                  onPressed: () {
                    value.setTabSelection('favorite');
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: value.tabSelection == 'favorite'
                        ? Utils.mainDark
                        : Utils.mainColor,
                  )),
              IconButton(
                  onPressed: () {
                    value.setTabSelection('shoppingCart');
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: value.tabSelection == 'shoppingCart'
                        ? Utils.mainDark
                        : Utils.mainColor,
                  ))
            ],
          );
        },
      ),
    );
  }
}
