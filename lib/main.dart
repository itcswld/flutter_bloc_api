import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/Controller/BLoc/Api/api_bloc.dart';

import 'View/DataPage.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ApiBloc>(create: (BuildContext context) => ApiBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GetPage());
  }
}
