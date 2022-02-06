import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constant.dart';
import '/provider/provider.dart';
import '/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            CustomAppBar(
              leading: const ProfileImage(),
              onLeadingTap: () {},
              title: Text(
                'Cart',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
                child: cart.items.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/empty-cart.png'),
                          Text('NO ITEMS IN CART',
                              style: Theme.of(context).textTheme.bodyText1)
                        ],
                      )
                    : ListView.builder(
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) => CartItem(
                              id: cart.items.values.toList()[index].id,
                              title: cart.items.values.toList()[index].title,
                              imageUrl:
                                  cart.items.values.toList()[index].imageUrl,
                              subCategory:
                                  cart.items.values.toList()[index].subCategory,
                              quantity:
                                  cart.items.values.toList()[index].quantity,
                              price: cart.items.values.toList()[index].price,
                              productId: cart.items.keys.toList()[index],
                            ))),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            SizedBox(
              width: double.infinity,
              height: kDefaultPadding * 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: kDefaultPadding * 2.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                          ),
                          FittedBox(
                            child: Text(
                              '\$${cart.totalAmount.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  OrderButton(cart: cart),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            const SizedBox(
              height: kDefaultPadding * 4,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<Manager>(
        builder: (_, tabManager, __) => InkWell(
          onTap: (widget.cart.items.isNotEmpty || _isLoading)
              ? () async {
                  setState(() {
                    _isLoading = true;
                  });
                  await Provider.of<Orders>(context, listen: false).addOrder(
                      widget.cart.items.values.toList(),
                      widget.cart.totalAmount);
                  widget.cart.clear();
                  setState(() {
                    _isLoading = false;
                  });
                }
              : () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  final snackBar = SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      'There are no items in your cart, kindly add :(',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'HomePage',
                      onPressed: () {
                        tabManager.gotoHomePage();
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              child: _isLoading
                  ? const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    )
                  : Text(
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
}
