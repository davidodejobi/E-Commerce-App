import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/rounded_icon_button.dart';
import '../constant.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product? product;
  const ProductDetailsScreen({
    this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Hero(
                  tag: product!.id!,
                  child: CachedNetworkImage(
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            offset: const Offset(0, 15),
                            blurRadius: 30,
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    height: size.height * 0.6,
                    width: size.width,
                    imageUrl: product!.imageUrl!,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      RoundedIconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: kPrimaryColor,
                          size: 18,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      RoundedIconButton(
                        icon: Icon(
                          product!.isFavorite!
                              ? Icons.favorite_sharp
                              : Icons.favorite_border,
                          color: kPrimaryColor,
                          size: 18,
                        ),
                        onPressed: () {
                          product!.toggleFavoriteStatus();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding * 1.5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title!,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        product!.subCategory!.toString().split('.').last,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '\$${product!.price!}',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
              ),
              child: Text(
                product!.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                          ),
                          decoration: BoxDecoration(
                            gradient: kDefaultGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Order Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    InkWell(
                      hoverColor: Colors.grey[700],
                      onTap: () {
                        cart.addItem(
                            productId: product!.id,
                            price: product!.price,
                            title: product!.title,
                            imageUrl: product!.imageUrl,
                            subCategory: product!.subCategory,
                            isBuying: product!.isBuying);
                      },
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.shopping_cart_rounded,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
