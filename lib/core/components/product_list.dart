import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/dio_consume.dart';
import 'package:e_commerce_app/core/components/product_card.dart';
import 'package:e_commerce_app/core/cubit/home_cubit.dart';
import 'package:e_commerce_app/screens/products/logic/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, this.shrink, this.physics});
  final bool? shrink;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(DioConsume(dio: Dio()))..getProducts(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<ProductModel> products = HomeCubit.get(context).productModel;
          return ListView.builder(
            itemCount: products.length,
            shrinkWrap: shrink ?? true,
            physics: physics ?? NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductCard(productList: products[index]);
            },
          );
        },
      ),
    );
  }
}
