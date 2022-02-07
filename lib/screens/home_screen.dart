import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/provider.dart';
import '/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final ScrollController? controller;
  const HomePage({Key? key, required this.controller}) : super(key: key);

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
                leading: const ProfileImage(),
                onLeadingTap: () {},
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
                    ),
                    Text(
                      'Ilorin, Nigeria',
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
                  controller: controller,
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
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
