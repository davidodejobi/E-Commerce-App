import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '/provider/provider.dart';
import 'edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldScaffoldMessenger = ScaffoldMessenger.of(context);
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
              CustomAppBar(
                leading: const Icon(
                  Icons.add,
                ),
                onLeadingTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProductScreen(),
                    ),
                  );
                },
                title: const Text('Your Products'),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: ListView.builder(
                    itemCount: product.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleUserProduct(
                        onPressed: () async {
                          try {
                            await Provider.of<Products>(context, listen: false)
                                .deleteProduct(product.items[index].id!);
                          } catch (error) {
                            print(error);
                            final snackBar = SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                'Deleting Failed, please try to check your internet connection',
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                            );
                            scaffoldScaffoldMessenger.showSnackBar(snackBar);
                          }
                        },
                        product: product.items[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
