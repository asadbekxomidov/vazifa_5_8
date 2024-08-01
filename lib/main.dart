import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vazifa_8/service/book_services.dart';
import 'package:vazifa_8/views/screen/book_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BookProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BookListScreen(),
      ),
    );
  }
}
