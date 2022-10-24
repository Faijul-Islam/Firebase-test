import 'package:e_comearce/vewse/splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';

import 'vewse/bottomPayges/bottomNavScreen.dart';

void main() {
  Stripe.publishableKey =
      'pk_test_51LvZVUCvZtHh9EaBFD6ByZCsjxV6R62myu4q5cuRdzBtiyNJaUyuAtiAwQZJaT0FVkspjvD3CM3aWOGSY8izhhhF00m5vqqyPO';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme.apply()
              )
            ),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
