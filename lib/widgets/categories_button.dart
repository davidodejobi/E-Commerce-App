import 'package:flutter/material.dart';

import '/models/models.dart';
import '../constant.dart';

class CategoriesButton extends StatefulWidget {
  const CategoriesButton({Key? key}) : super(key: key);

  @override
  State<CategoriesButton> createState() => _CategoriesButtonState();
}

class _CategoriesButtonState extends State<CategoriesButton> {
  ProductCategory? _isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
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
            }));
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
                  fontSize: 14,
                ),
          ),
        )),
      ),
    );
  }
}
