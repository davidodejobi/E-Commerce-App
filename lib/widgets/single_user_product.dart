import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/screens/edit_product_screen.dart';
import 'package:flutter/material.dart';

import '/models/models.dart';
import '../constant.dart';

class SingleUserProduct extends StatelessWidget {
  final Product? product;
  final VoidCallback? onPressed;
  const SingleUserProduct({
    Key? key,
    this.product,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: kDefaultPadding / 1.5),
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      height: 100,
      child: Row(
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kDefaultPadding / 2),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              height: 100,
              width: size.width * 0.20,
            ),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fadeOutDuration: const Duration(seconds: 1),
            fadeInDuration: const Duration(seconds: 3),
            imageUrl: product!.imageUrl!,
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Text(
            product!.title!,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EditProductScreen(
                      isFavorite: product!.isFavorite,
                      id: product!.id,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
