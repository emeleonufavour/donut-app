import 'package:donut_app/cart%20page%20stuff/cartbadge.dart';
import 'package:donut_app/models/donutmodel.dart';
import 'package:donut_app/services/donutservice.dart';
import 'package:donut_app/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../services/cartservice.dart';

class DonutShopDetails extends StatefulWidget {
  DonutShopDetails({super.key});

  @override
  State<DonutShopDetails> createState() => _DonutShopDetailsState();
}

class _DonutShopDetailsState extends State<DonutShopDetails>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? _controller;
  Animation<double>? rotationAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();
    rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.linear));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var donutService = Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.getSelectedDonut();
    return Scaffold(
      appBar: AppBar(
        actions: [DonutShoppingCartBadge()],
        iconTheme: const IconThemeData(color: Utils.mainDark),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SizedBox(
          width: 120,
          child: Image.network(Utils.donutLogoRedText),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) / 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: RotationTransition(
                    turns: rotationAnimation!,
                    child: Hero(
                      tag: selectedDonut!.name,
                      child: Image.network(
                        selectedDonut!.imgUrl,
                        width: MediaQuery.of(context).size.width * 1.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      selectedDonut!.name,
                      style: const TextStyle(
                          color: Utils.mainDark,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Utils.mainDark,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Utils.mainDark,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    selectedDonut!.price.toStringAsFixed(2),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(selectedDonut!.description),
                Consumer<DonutShoppingCartService>(
                  builder: ((context, cartService, child) {
                    if (!cartService.isDonutInCart(selectedDonut!)) {
                      return GestureDetector(
                        onTap: (() {
                          cartService.addToCart(selectedDonut!);
                        }),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Utils.mainDark.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart,
                                  color: Utils.mainDark,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Utils.mainDark),
                                )
                              ]),
                        ),
                      );
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.check_rounded,
                              color: Utils.mainDark,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Added To Cart',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Utils.mainDark),
                            )
                          ]),
                    );
                  }),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
