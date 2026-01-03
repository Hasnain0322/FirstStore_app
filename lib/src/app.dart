import 'package:flutter/material.dart';
import 'utils/router.dart'; // Ensure this points to your router.dart

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(  // Must have .router
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, // Must point to AppRouter.router
    );
  }
}