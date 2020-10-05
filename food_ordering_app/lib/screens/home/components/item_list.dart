import 'package:flutter/material.dart';
import 'package:food_ordering_app/screens/details/details_screen.dart';
import 'package:food_ordering_app/screens/home/components/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen();
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/chinese_noodles.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/burger_beer.svg",
            title: "Burger & Beer",
            shopName: "MacDonald's",
            press: () {},
          ),
        ],
      ),
    );
  }
}
