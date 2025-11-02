import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/components/cached_image.dart';
import 'package:e_commerce_app/core/components/custom_e_button.dart';
import 'package:e_commerce_app/core/function/navigate_to.dart';
import 'package:e_commerce_app/screens/products/logic/model/product_model.dart';
import 'package:e_commerce_app/screens/product_details/ui/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productList});
  final ProductModel productList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          navigateTo(context, ProductDetailsPage(productDetail: productList)),
      child: Card(
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
                      '${productList.sale}% OFF',
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
                        "${productList.productName}",
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
                            '${productList.price} LE',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${productList.oldPrice} LE',
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
      ),
    );
  }
}
