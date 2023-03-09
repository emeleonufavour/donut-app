import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/donutpage.dart';
import '../utilities.dart';

class DonutPager extends StatefulWidget {
  const DonutPager({super.key});

  @override
  State<DonutPager> createState() => _DonutPagerState();
}

class _DonutPagerState extends State<DonutPager> {
  int _currentPage = 0;
  PageController? _controller;
  List<DonutPage> pages = [
    DonutPage(imgUrl: Utils.donutPromo1, logoUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo2, logoUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo3, logoUrl: Utils.donutLogoRedText),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
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
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Expanded(
              child: PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: List.generate(pages.length, (index) {
              DonutPage currentPage = pages[index];
              return Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0.0, 5.0))
                    ],
                    image: DecorationImage(
                        image: NetworkImage(currentPage.imgUrl),
                        fit: BoxFit.cover)),
                child: Image.network(
                  currentPage.logoUrl,
                  width: 120,
                ),
              );
            }),
          )),
          PageViewIndicator(
              pageController: _controller!,
              currentPage: _currentPage,
              numberOfPages: pages.length),
        ],
      ),
    );
  }
}

class PageViewIndicator extends StatelessWidget {
  PageController pageController;
  int currentPage;
  int numberOfPages;
  PageViewIndicator(
      {required this.pageController,
      required this.currentPage,
      required this.numberOfPages,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfPages, (index) {
        return GestureDetector(
          onTap: () {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeIn,
            height: 15,
            width: 15,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: currentPage == index
                    ? Utils.mainColor
                    : Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
          ),
        );
      }),
    );
  }
}
