import 'package:flutter/material.dart';
import 'package:gigqo_assignment/core/config/routes/routes.dart';
import 'package:gigqo_assignment/modules/main/providers/counter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: HOME_SCREEN_ROUTE,
          routes: routes,
        ),
    );
  }
}


