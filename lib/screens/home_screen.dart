import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/models/filter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (_) => Filter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              CustomAppBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Suit Store',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                      // style: TextStyle(
                      //     fontSize: 11,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.grey)
                    ),
                    Text(
                      'Jakarta, INA',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: kDefaultPadding / 2,
                    ),
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
                    const CategoriesButton(),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    const ProductList(),
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
