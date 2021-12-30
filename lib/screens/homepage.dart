import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '/widgets/widgets.dart';
import '/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductCategory? _isPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: const [
                  SearchBar(),
                  FilterOrSettings(),
                ],
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              const AdvertisementCard(),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mainCategory.length,
                      itemBuilder: (context, index) {
                        return buildCategory(context, mainCategory[index].title,
                            onTap: () {
                          setState(() {
                            _isPressed = mainCategory[index].id;
                          });
                        },
                            gradient: _isPressed == mainCategory[index].id
                                ? kDefaultGradient
                                : kUnselectedGradient,
                            color: _isPressed == mainCategory[index].id
                                ? Colors.white
                                : Colors.grey);
                      })),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: kDefaultPadding, right: kDefaultPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kDefaultPadding),
                          child: CachedNetworkImage(
                            imageUrl: items[index].imageUrl!,
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fadeOutDuration: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 3),
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1!,
                                  ),
                                  Text(
                                    '\$100.00',
                                    style: Theme.of(context)
                                        .textTheme
                                        .overline!
                                        .copyWith(
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
                                padding:
                                    const EdgeInsets.all(kDefaultPadding / 6),
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
            ],
          ),
        )
      ],
    );
  }

  InkWell buildCategory(
    BuildContext context,
    String text, {
    VoidCallback? onTap,
    Gradient? gradient,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        margin: const EdgeInsets.only(right: kDefaultPadding / 2),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: color,
                  fontSize: 16,
                ),
          ),
        )),
      ),
    );
  }
}
