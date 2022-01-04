import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/models.dart';
import '/widgets/widgets.dart';
import '../constant.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final filterProduct = Provider.of<Filter>(context).selectedOption;

    final products =
        filterProduct ? productsData.favoriteItems : productsData.items;

    return Container(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: kDefaultPadding / 2,
          mainAxisSpacing: kDefaultPadding,
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: const ProductListItem(),
        ),
      ),
    );
  }
}
