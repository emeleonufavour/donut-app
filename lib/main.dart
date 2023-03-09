import 'package:donut_app/pages/detailspage.dart';
import 'package:donut_app/pages/initialpage.dart';
import 'package:donut_app/services/bottomnav.dart';
import 'package:donut_app/services/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/donutservice.dart';
import 'splashpage.dart';
import 'utilities.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<DonutBarSelectionService>(
          create: (_) => DonutBarSelectionService()),
      ChangeNotifierProvider<DonutService>(create: (_) => DonutService()),
      ChangeNotifierProvider<DonutShoppingCartService>(
          create: (_) => DonutShoppingCartService()),
    ],
    builder: ((context, child) => const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: Utils.mainAppNav,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/main': (context) => DonutShopMain(),
        '/details': (context) => DonutShopDetails(),
      },
    );
  }
}
