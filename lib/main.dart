import 'package:flutter/material.dart';
import 'package:restofatlem_14624/welcome.dart';
import 'package:restofatlem_14624/login.dart';
import 'package:restofatlem_14624/dashboard.dart';
import 'package:restofatlem_14624/update_user.dart';
import 'package:restofatlem_14624/register.dart';
import 'package:restofatlem_14624/cart.dart';
import 'package:restofatlem_14624/checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Rute awal adalah splash screen
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/register': (context) => Register(),
        '/update-user': (context) => UpdateUser(),
        '/cart': (context) =>
            Cart(cartItems: []), // Inisialisasi dengan keranjang kosong
        '/checkout': (context) => Checkout(),
      },

    );
  }
}
