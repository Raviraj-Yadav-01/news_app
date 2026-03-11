
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screen/splash_page/splash_page.dart';
import 'package:news_app/data/repositories/news_repository.dart';
import 'package:news_app/data/service/api_service.dart';
import 'Bloc/news_bloc.dart';


void main() {
  runApp(
      MultiBlocProvider(
          providers:[
            BlocProvider( create: (context) => NewsBloc(NewsRepository(NewsApiService()))),
          ], child:MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}


