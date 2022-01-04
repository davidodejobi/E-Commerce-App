import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/models.dart';
import '../constant.dart';

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Categories>(context);

    final mainCategory = category.mainCategory;

    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mainCategory.length,
        itemBuilder: (context, index) {
          return buildCategory(context, mainCategory[index].title!, onTap: () {
            category.changeCategoryColor();
            category.isPressed = mainCategory[index].id;
          },
              gradient: category.isPressed == mainCategory[index].id
                  ? kDefaultGradient
                  : kUnselectedGradient,
              color: category.isPressed == mainCategory[index].id
                  ? Colors.white
                  : Colors.grey);
        },
      ),
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
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: kDefaultPadding / 2),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(kDefaultPadding),
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
                ),
          ),
        )),
      ),
    );
  }
}
