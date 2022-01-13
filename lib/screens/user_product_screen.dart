import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '/models/models.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final product = Provider.of<Products>(context);
    return Scaffold(
      drawer: MyDrawer(size: size),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: CustomAppBar(
                title: Text('Your Products'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return SingleUserProduct(product: product.items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
