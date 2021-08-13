import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/main/factories/factories.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';

abstract class Routes {
  static const home = '/';

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    final routes = <String, WidgetBuilder>{
      home: _makeHomePage,
    };

    return routes;
  }

  static BlocProvider<HomeCubit> _makeHomePage(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(
          getHomeData: makeRemoteGetHomeData(),
          purchaseProduct: makeRemotePurchaseProduct()),
      child: const HomePage(),
    );
  }
}
