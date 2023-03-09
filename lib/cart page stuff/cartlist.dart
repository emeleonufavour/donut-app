import 'package:donut_app/cart%20page%20stuff/cartlistrow.dart';
import 'package:donut_app/services/cartservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/donutmodel.dart';

class DonutShoppingList extends StatefulWidget {
  List<DonutModel> donuts;
  DonutShoppingCartService cartService;
  DonutShoppingList(
      {required this.donuts, required this.cartService, super.key});

  @override
  State<DonutShoppingList> createState() => _DonutShoppingListState();
}

class _DonutShoppingListState extends State<DonutShoppingList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.donuts.length,
      itemBuilder: (context, index) {
        DonutModel currentDonut = widget.donuts[index];
        return DonutShoppingListRow(
            donut: currentDonut,
            onDeleteRow: () {
              widget.cartService.removeFromCart(currentDonut);
            });
      },
    );
  }
}
