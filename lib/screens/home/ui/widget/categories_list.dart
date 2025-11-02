import 'package:e_commerce_app/core/colors.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: AppColors.kWhiteColor,
                  child: Icon(categories[index].icon, size: 40),
                ),
                Text(categories[index].text),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Categories> categories = [
  Categories(Icons.sports, 'Sports'),
  Categories(Icons.tv, 'Electronics'),
  Categories(Icons.collections, 'Collections'),
  Categories(Icons.book, 'Books'),
  Categories(Icons.games, 'Games'),
  Categories(Icons.bike_scooter, 'Bike'),
];

class Categories {
  IconData icon;
  String text;
  Categories(this.icon, this.text);
}
