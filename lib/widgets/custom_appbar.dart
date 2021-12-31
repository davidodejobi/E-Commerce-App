import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/widgets/widgets.dart';
import '../constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedIconButton(
            onPressed: () {},
            icon: Icon(
              Icons.line_style,
              color: Colors.pink[200],
              size: 20,
            ),
          ),
          Column(
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
          RoundedIconButton(
            onPressed: () {},
            icon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
              ),
              child: CachedNetworkImage(
                  imageUrl:
                      'https://avatars.githubusercontent.com/u/63846399?s=400&u=66d28bb6d2d4ddc4c38d1d3a87da5890ca4ceb49&v=4',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) {
                    // you can access to imageProvider
                    return CircleAvatar(
                      // or any widget that use imageProvider like (PhotoView)
                      backgroundImage: imageProvider,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
