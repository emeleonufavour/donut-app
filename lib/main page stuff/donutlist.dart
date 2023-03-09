import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/donutmodel.dart';
import '../utilities.dart';
import 'donutcard.dart';

class DonutList extends StatefulWidget {
  List<DonutModel> donuts;
  DonutList({required this.donuts, super.key});

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];
  @override
  void initState() {
    var future = Future(
      () {},
    );
    for (int i = 0; i < widget.donuts.length; i++) {
      future = future.then((value) {
        return Future.delayed((Duration(milliseconds: 250)), (() {
          insertedItems.add(widget.donuts[i]);
          _key.currentState!.insertItem(i);
        }));
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      scrollDirection: Axis.horizontal,
      initialItemCount: insertedItems.length,
      itemBuilder: (context, index, animation) {
        DonutModel currentDonut = widget.donuts[index];
        return SlideTransition(
          position: Tween(begin: Offset(0.2, 0.0), end: Offset(0.0, 0.0))
              .animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeIn)),
          child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeIn)),
              child: DonutCard(donutInfo: currentDonut)),
        );
      },
    );
  }
}
