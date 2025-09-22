import 'package:e_commerce_app/configuration/components/custom_search_field.dart';
import 'package:e_commerce_app/configuration/components/product_list.dart';
import 'package:e_commerce_app/screens/home/ui/widget/categories_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const CustomSearchField(),
          const SizedBox(height: 20),
          Image.asset('assets/images/buy.jpg'),
          const SizedBox(height: 15),
          const Text('Popular Categories', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 15),
          const CategoriesList(),
          const SizedBox(height: 15),
          const Text('Recently Products', style: TextStyle(fontSize: 20)),

          ProductsList(),
        ],
      ),
    );
  }
}
