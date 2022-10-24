import 'package:e_comearce/vewse/bottomPayges/payment.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
  //var obj = PaymentController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Make A Payment'),
        ),
      ),
    );
  }
}
