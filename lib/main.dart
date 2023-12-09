import 'package:codetest1/bloc/get/cubit/get_book_cubit.dart';
import 'package:codetest1/module.dart';
import 'package:codetest1/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<GetBookCubit>(
        create: (context) => getIt.call(),
        child: Home(),
      ),
    );
  }
}
