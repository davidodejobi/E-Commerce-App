import 'package:flutter/material.dart';

import '../../constant.dart';

class DrawerButton extends StatelessWidget {
  final String? buttonText;
  final IconData? buttonIcon;
  final VoidCallback? onTap;
  const DrawerButton({
    this.onTap,
    required this.buttonIcon,
    required this.buttonText,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: kDefaultPadding,
        left: kDefaultPadding,
        right: kDefaultPadding,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [kDefaultShadow],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: size.width * 0.80 - 80,
                child: Center(
                  child: Text(buttonText!,
                      style: Theme.of(context).textTheme.bodyText1!.apply(
                            color: Colors.white,
                          )),
                ),
                decoration: BoxDecoration(
                    gradient: kDefaultGradient,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(200),
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40))),
              ),
              Icon(
                buttonIcon,
                color: kPrimaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
