import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/cubit/cubit.dart';
import 'package:new_project/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GettingStartedScreen(),
      ),
    );
  }
}
