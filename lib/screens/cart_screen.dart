import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            CustomAppBar(
              title: Text(
                'Jakarta, INA',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
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
                          borderRadius:
                              BorderRadius.circular(kDefaultPadding / 2),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 100,
                        width: size.width * 0.20,
                      ),
                      imageUrl:
                          'https://ae01.alicdn.com/kf/HTB1lXYCSFXXXXc3aXXXq6xXFXXXK/Spring-Summer-Formal-Elegant-Pink-Blazers-Women-Business-Suits-With-Pants-and-Jackets-Professional-Pants-Suits.jpg',
                    ),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Big Sale',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Text(
                          'Women',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          '\$150',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 25,
                          width: 25,
                          margin: const EdgeInsets.only(
                            right: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: kDefaultGradient,
                            borderRadius:
                                BorderRadius.circular(kDefaultPadding / 6),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove,
                                  color: Colors.black, size: 15),
                            ),
                            Text(
                              '1',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add,
                                  color: Colors.black, size: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            SizedBox(
              width: double.infinity,
              height: kDefaultPadding * 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                        Text(
                          '\$150.00',
                          style:
                              Theme.of(context).textTheme.headline1!.copyWith(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: kDefaultPadding * 2,
                  ),
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
                            'Buy Now',
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
            )
          ],
        ),
      ),
    );
  }
}
