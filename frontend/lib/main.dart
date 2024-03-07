// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:frontend/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Ardi Travel',
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
