import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class CartItem extends StatefulWidget {
  // id: id, title: title, quantity: quantity, price: price
  final String? id;
  final String? title;
  final String? imageUrl;
  final SubCategory? subCategory;
  final int? quantity;
  final double? price;
  final String? productId;
  final bool? isBuying;

  const CartItem({
    this.id,
    this.title,
    this.imageUrl,
    this.subCategory,
    this.quantity,
    this.price,
    this.productId,
    this.isBuying,
    Key? key,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kPrimaryColor),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child:
                    Text('Yes', style: Theme.of(context).textTheme.headline6),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(widget.productId!);
      },
      child: Container(
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
              imageUrl: widget.imageUrl!,
            ),
            const SizedBox(
              width: kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title!,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: isChecked == true
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                ),
                Text(
                  widget.subCategory.toString().split('.').last,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        decoration: isChecked == true
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                ),
                const SizedBox(
                  height: kDefaultPadding / 4,
                ),
                Text(
                  '\$${widget.price}',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        decoration: isChecked == true
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Consumer<Cart>(
                    builder: (_, cart, __) => SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                              value: isChecked,
                              onChanged: (bool? checked) {
                                setState(
                                  () {
                                    isChecked = checked!;
                                  },
                                );
                              }),
                        )),
                // Container(
                //   height: 25,
                //   width: 25,
                //   margin: const EdgeInsets.only(
                //     right: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     gradient: kDefaultGradient,
                //     borderRadius: BorderRadius.circular(kDefaultPadding / 6),
                //   ),
                //   child: const Icon(
                //     Icons.check,
                //     color: Colors.white,
                //     size: 20,
                //   ),
                // ),
                Row(
                  children: [
                    Consumer<Cart>(
                      builder: (_, cart, ch) => IconButton(
                          onPressed: () {
                            cart.removeSingleItem(widget.productId!);
                          },
                          icon: ch!),
                      child: const Icon(Icons.remove,
                          color: Colors.black, size: 15),
                    ),
                    Text(
                      '${widget.quantity}',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                    Consumer<Cart>(
                      builder: (_, cart, ch) => IconButton(
                          onPressed: () {
                            cart.addSingleItem(widget.productId!);
                          },
                          icon: ch!),
                      child:
                          const Icon(Icons.add, color: Colors.black, size: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
