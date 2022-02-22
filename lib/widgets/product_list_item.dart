import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '/provider/provider.dart';
import '../constant.dart';
import 'widgets.dart';

class ProductListItem extends StatefulWidget {
  const ProductListItem({Key? key}) : super(key: key);

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              child: Hero(
                tag: product.id!,
                child: CachedNetworkImage(
                  imageUrl: product.imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Lottie.asset(
                    'assets/animations/loading.json',
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fadeOutDuration: const Duration(seconds: 1),
                  fadeInDuration: const Duration(seconds: 1),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1!,
                      ),
                      Text(
                        '\$${product.price}',
                        style: Theme.of(context).textTheme.overline!.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),
                Consumer<Product>(
                  builder: (context, product, _) => InkWell(
                    onTap: () {
                      product.toggleFavoriteStatus(authData.token);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding / 6),
                      decoration: BoxDecoration(
                        gradient: kDefaultGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        product.isFavorite!
                            ? Icons.favorite_sharp
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
