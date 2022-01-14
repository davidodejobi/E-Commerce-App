// ignore_for_file: unnecessary_const

import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '/models/models.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final product = Provider.of<Products>(context);
    return Scaffold(
      drawer: MyDrawer(size: size),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            children: [
              PopCustomAppBar(
                title: const Text('Your Products'),
                leading: InkWell(
                    child: RoundedIconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EditProductScreen()));
                  },
                )),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: product.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleUserProduct(product: product.items[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
