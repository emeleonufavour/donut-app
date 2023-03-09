import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/donutmodel.dart';
import '../utilities.dart';

class DonutShoppingListRow extends StatelessWidget {
  DonutModel donut;
  Function onDeleteRow;
  DonutShoppingListRow(
      {required this.donut, required this.onDeleteRow, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              donut.imgUrl,
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donut.name,
                  style: const TextStyle(
                      color: Utils.mainDark,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2, color: Utils.mainDark.withOpacity(0.2))),
                  child: Text('${donut.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Utils.mainDark.withOpacity(0.4))),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )),
            IconButton(
                onPressed: () {
                  onDeleteRow();
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: Utils.mainColor,
                ))
          ],
        ),
      ),
    );
  }
}
//Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       height: 50,
    //       width: 50,
    //       color: Colors.red,
    //     ),
    //     Expanded(
    //         child: Column(
    //       children: [
    //         Container(
    //           height: 30,
    //           color: Colors.yellow,
    //         ),
    //         Container(
    //           height: 30,
    //           color: Colors.green,
    //         ),
    //       ],
    //     )),
    //     Container(
    //       width: 50,
    //       height: 50,
    //       color: Colors.red,
    //     )
    //   ],
    // );