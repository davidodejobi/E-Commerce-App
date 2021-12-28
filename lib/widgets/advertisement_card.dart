import 'package:flutter/material.dart';

import '../constant.dart';

class AdvertisementCard extends StatelessWidget {
  const AdvertisementCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kDefaultPadding,
        ),
        gradient: kDefaultGradient,
      ),
      height: 150,
      width: double.infinity,
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              Positioned(
                top: -20,
                left: -10,
                child: Image.asset(
                  'assets/images/woman-shopping.png',
                  scale: 1.855 / 1,
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Big Sale',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
                    Text(
                      'Get the trendy\nfashion at a discount \noff up to 50%',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
