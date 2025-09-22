import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/components/cached_image.dart';
import 'package:e_commerce_app/configuration/components/custom_e_button.dart';
import 'package:e_commerce_app/configuration/components/custom_search_field.dart';
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

          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ProductCard();
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kWhiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        spacing: 15,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: CachedImage(
                  url:
                      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
              ),
              Positioned(
                child: Container(
                  width: 65,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    '10% OFF',
                    style: TextStyle(color: AppColors.kWhiteColor),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 7,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Name',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite, color: AppColors.kGreyColor),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '100 LE',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '150 LE',
                          style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,

                            color: AppColors.kGreyColor,
                          ),
                        ),
                      ],
                    ),
                    CustomEButton(text: 'Buy Now', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
