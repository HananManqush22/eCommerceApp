import 'package:e_commerce_app/configuration/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, this.shrink, this.physics});
  final bool? shrink;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: shrink ?? true,
      physics: physics ?? NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ProductCard();
      },
    );
  }
}
