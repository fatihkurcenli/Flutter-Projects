import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/home/components/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryItem(
            title: "Chicken",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Ice Cream",
            press: () {},
          ),
          CategoryItem(
            title: "Cookie",
            press: () {},
          ),
          CategoryItem(
            title: "Lolipop",
            press: () {},
          ),
          CategoryItem(
            title: "combo meal",
            press: () {},
          ),
        ],
      ),
    );
  }
}
