import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/app_bar.dart';
import 'components/image_body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppbar(),
      body: ImageBody(),
    );
  }
}
