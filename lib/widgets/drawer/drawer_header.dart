import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -200,
          left: -37.5,
          child: Container(
            height: size.height * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor!.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          top: -150,
          left: -50,
          child: Container(
            height: size.height * 0.7,
            width: size.width * 0.7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor!.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: kDefaultPadding,
          child: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  height: 80,
                  width: 80,
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/63846399?s=400&u=66d28bb6d2d4ddc4c38d1d3a87da5890ca4ceb49&v=4',
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  'David Odejobi',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: kPrimaryColor),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.35,
        ),
      ],
    );
  }
}
