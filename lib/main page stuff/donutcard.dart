import 'package:donut_app/services/donutservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/donutmodel.dart';
import '../utilities.dart';

class DonutCard extends StatelessWidget {
  DonutModel donutInfo;
  DonutCard({required this.donutInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        var donutService = Provider.of<DonutService>(context, listen: false);
        donutService.onDonutSelected(donutInfo);
      }),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: 10, top: 80, right: 10, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0.0, 4.0))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    donutInfo.name,
                    style: const TextStyle(
                        color: Utils.mainDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Utils.mainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    '\$${donutInfo.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: donutInfo.name,
              child: Image.network(
                donutInfo.imgUrl,
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}
