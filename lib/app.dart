import 'package:ecommerseproject/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // title: 'E-commerce Project',
       home: const Scaffold(
      body: Center(
        child: Text(
          "Welcome to E-Commerce App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
       )
    );
  }
}
