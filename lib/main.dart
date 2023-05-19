import 'package:flutter/material.dart';
import 'features/home/presentation/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(fontSize: 20),
            displaySmall: TextStyle(fontSize: 18)),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
