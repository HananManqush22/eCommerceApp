import 'package:e_commerce_app/configuration/components/custom_search_field.dart';
import 'package:e_commerce_app/configuration/components/product_list.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: const Text(
              'Welcome To Our Market',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          const CustomSearchField(),
          const SizedBox(height: 15),
          ProductsList(),
        ],
      ),
    );
  }
}
