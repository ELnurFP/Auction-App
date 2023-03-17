import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qobustan/utils/app_router.dart';
import 'init.dart';
import 'providers/global_provider.dart';

// ChangeNotifierProvider(
//       create: (context) =>
//           InternetCheckerProvider()..getConnectivity(context))
void main() async {
  await init();
  runApp(ChangeNotifierProvider(
      create: (context) => GlobalProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qobustan',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
            headline1: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            headline2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        fontFamily: 'Poppins',
      ),
      initialRoute: '/',
    );
  }
}
