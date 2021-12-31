import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '/models/product.dart';
import '../constant.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: kDefaultPadding / 2,
          mainAxisSpacing: kDefaultPadding,
          crossAxisCount: 2,
          childAspectRatio: 0.65,
        ),
        itemBuilder: (context, index) => GestureDetector(
          // behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  id: items[index].id,
                  imageUrl: items[index].imageUrl,
                  price: items[index].price,
                  description: items[index].description,
                  title: items[index].title,
                  subCategory: items[index].subCategory.toString(),
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
                    tag: items[index].id!,
                    child: CachedNetworkImage(
                      imageUrl: items[index].imageUrl!,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fadeOutDuration: const Duration(seconds: 1),
                      fadeInDuration: const Duration(seconds: 3),
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
                            items[index].title!,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1!,
                          ),
                          Text(
                            '\$${items[index].price}',
                            style:
                                Theme.of(context).textTheme.overline!.copyWith(
                                      color: Colors.grey[600],
                                    ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // ignore: avoid_print
                        print('Favorite button pressed');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(kDefaultPadding / 6),
                        decoration: BoxDecoration(
                          gradient: kDefaultGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
