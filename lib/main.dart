import 'package:flutter/material.dart';
import 'package:nomad_movie/screens/homeScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
