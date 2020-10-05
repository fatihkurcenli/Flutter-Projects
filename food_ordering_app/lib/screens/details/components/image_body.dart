import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'item_image.dart';
import 'order_button.dart';
import 'title_price_rating.dart';

class ImageBody extends StatelessWidget {
  const ImageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          shopName(name: "MacDonalds"),
          TittlePrice(
            name: "Cheese Burger",
            numOfReviews: 24,
            price: 15,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, whIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
            style: TextStyle(
              height: 1.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 30),
          OrderButton(
            size: size,
            press: () {},
          ),
        ],
      ),
    );
  }

  Row shopName({String name}) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(name),
      ],
    );
  }
}
