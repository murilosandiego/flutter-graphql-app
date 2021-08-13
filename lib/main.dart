import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuconta_marketplace/main/factories/factories.dart';
import 'package:nuconta_marketplace/ui/pages/pages.dart';

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
        title: 'NuConta Marketplace',
        theme: ThemeData(
          primaryColor: const Color(0xFF820BD1),
          accentColor: const Color(0xFF820BD1),
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF820BD1),
            secondary: Color(0xFF820BD1),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
