import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'providers/sort_provider.dart';

void main() {
  // Preserve native splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SortProvider())],
      child: const SortingApp(),
    ),
  );
}
