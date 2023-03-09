import 'package:donut_app/models/donutfilterbaritem.dart';
import 'package:donut_app/services/donutservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../utilities.dart';

class DonutFilterBar extends StatelessWidget {
  const DonutFilterBar({super.key});

  Alignment alignmentBasedOnType(filterBarItem) {
    switch (filterBarItem) {
      case 'classic':
        return Alignment.centerLeft;
      case 'sprinkled':
        return Alignment.center;
      case 'stuffed':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Consumer<DonutService>(builder: ((context, value, child) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(value.filterBarItems.length, (index) {
                DonutFilterBarItem item = value.filterBarItems[index];
                return GestureDetector(
                  onTap: (() {
                    value.filteredDonutsByType(item.id);
                  }),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      '${item.label}',
                      style: TextStyle(
                        color: value.selectedBarItem == item.id
                            ? Utils.mainColor
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                AnimatedAlign(
                  alignment: alignmentBasedOnType(value.selectedBarItem),
                  duration: Duration(milliseconds: 250),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Utils.mainColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            )
          ],
        );
      })),
    );
  }
}
