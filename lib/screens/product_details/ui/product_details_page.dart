import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/dio_consume.dart';
import 'package:e_commerce_app/core/colors.dart';
import 'package:e_commerce_app/core/components/cached_image.dart';
import 'package:e_commerce_app/core/function/build_custom_app_bar.dart';
import 'package:e_commerce_app/screens/product_details/logic/cubit/product_detail_cubit.dart';
import 'package:e_commerce_app/screens/products/logic/model/product_model.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerce_app/screens/products/ui/widget/comments_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.productDetail});
  final ProductModel productDetail;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final TextEditingController _feedback = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailCubit(DioConsume(dio: Dio()))
            ..getRate(widget.productDetail.productId!),
      child: BlocConsumer<ProductDetailCubit, ProductDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductDetailCubit.get(context);
          return Scaffold(
            appBar: buildCustomAppBar(
              '${widget.productDetail.productName}',
              context,
            ),
            body: ListView(
              children: [
                CachedImage(
                  url:
                      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 16,
                  ),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.productDetail.productName}'),
                          Text('${widget.productDetail.price} RY'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('${cubit.averageRate} '),
                          Icon(Icons.star, color: Colors.amber),
                          const Spacer(),
                          Icon(Icons.favorite, color: AppColors.kGreyColor),
                        ],
                      ),
                      Text('${widget.productDetail.description}'),
                      RatingBar.builder(
                        initialRating: cubit.userRate.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) async {
                          await cubit.updateOrPostRate(
                            widget.productDetail.productId!,
                            {
                              "rate": rating.toInt(),
                              "for_product": widget.productDetail.productId!,
                              "for_user": cubit.userId,
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _feedback,
                        hintText: 'Type your feedback',
                        keyboardType: TextInputType.text,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            await cubit.postComment({
                              "comment": _feedback.text,
                              "for_user": cubit.userId,
                              "for_product": widget.productDetail.productId,
                              "user_name": "user name",
                            });
                            _feedback.clear();
                          },
                          icon: Icon(Icons.send),
                        ),
                      ),
                      Row(
                        children: [
                          Text('Comments', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      CommentsList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _feedback.dispose();
    super.dispose();
  }
}
