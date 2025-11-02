import 'package:e_commerce_app/core/components/product_list.dart';
import 'package:e_commerce_app/core/function/build_custom_app_bar.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('My Orders', context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProductsList(
            shrink: false,
            physics: AlwaysScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
