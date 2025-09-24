import 'package:e_commerce_app/configuration/colors.dart';
import 'package:e_commerce_app/configuration/components/cached_image.dart';
import 'package:e_commerce_app/configuration/function/build_custom_app_bar.dart';
import 'package:e_commerce_app/screens/auth/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar('Product Name', context),
      body: ListView(
        children: [
          CachedImage(
            url:
                'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Product Name'), Text('123 RY')],
                ),
                Row(
                  children: [
                    Text('0  '),
                    Icon(Icons.star, color: Colors.amber),
                    const Spacer(),
                    Icon(Icons.favorite, color: AppColors.kGreyColor),
                  ],
                ),
                Text('Product Description'),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hintText: 'Type your feedback',
                  keyboardType: TextInputType.text,
                  suffixIcon: Icon(Icons.send),
                ),
                Row(
                  children: [Text('Comments', style: TextStyle(fontSize: 18))],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => UserComments(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserComments extends StatelessWidget {
  const UserComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [Text('comment')]),
        Row(
          children: [
            Text('Replay', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(children: [Text('Replay.....')]),
      ],
    );
  }
}
