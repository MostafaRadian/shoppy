import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_simple_1/provider/auth_provider.dart';
import 'package:shop_app_simple_1/provider/product_provider.dart';
import 'package:shop_app_simple_1/screens/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://mracralljzfmlmahnsve.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1yYWNyYWxsanpmbWxtYWhuc3ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTgwMzI0OTksImV4cCI6MjA3MzYwODQ5OX0.6CCIV4mlYnv7gsBLQjv3bqLmKbA_ztBLTx5POT7Mfvw',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: LoginPage(),
      ),
    );
  }
}
