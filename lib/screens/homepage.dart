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
        child: Column(
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
    );
  }
}
