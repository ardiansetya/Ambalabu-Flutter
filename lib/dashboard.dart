import 'package:flutter/material.dart';
import 'package:restofatlem_14624/app_bar.dart';
import 'package:restofatlem_14624/product_list.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ProductList(),
    );
  }
}
