import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/main/factories/factories.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';
import 'package:nuconta_marketplace/ui/theme/theme.dart';
import 'package:nuconta_marketplace/ui/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomeCubit(
        getHomeData: makeRemoteGetHomeData(),
        purchaseProduct: makeRemotePurchaseProduct(),
      ),
      child: MaterialApp(
        title: StringConstants.appName,
        theme: makeAppTheme(),
        home: const HomePage(),
      ),
    );
  }
}
