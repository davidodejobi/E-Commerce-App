import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constant.dart';
import '/models/models.dart';
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
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
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
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            )
          ],
        ),
      ),
    );
  }
}
