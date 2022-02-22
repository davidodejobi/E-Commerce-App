import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
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

    List<Product> prod = [product!];

    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

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
                          product!.toggleFavoriteStatus(authData.token);
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
                    OrderButton(prod: prod, product: product),
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
                        );
                        //snackbar is used to display info below the screen
                        //after a certain action ot button is pressed.
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        // the code above overides the timer attached to the current
                        // snackbar and hides it immediately a button is pressed to
                        // avoid the user from having to wait for the timer to finish
                        final snackBar = SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            'Product added to your cart',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          duration: const Duration(seconds: 1),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              cart.removeSingleItem(product!.id!);
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.prod,
    required this.product,
  }) : super(key: key);

  final List<Product> prod;
  final Product? product;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );

    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.of(context, rootNavigator: true).pop();
        _controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<SingleOrder>(
        builder: (_, oSingItem, __) => InkWell(
          onTap: () {
            oSingItem.addOrder(widget.prod, widget.product!.price!);

            showDoneDialog(context);
          },
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showDoneDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/animations/done.json',
                repeat: false,
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.forward();
                },
              ),
              Text(
                'Order Placed Successfully',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              )
            ],
          ),
        );
      },
    );
  }
}
