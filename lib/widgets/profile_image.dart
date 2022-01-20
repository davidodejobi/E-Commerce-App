import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        boxShadow: [kDefaultShadow],
      ),
      child: CachedNetworkImage(
          imageUrl:
              'https://avatars.githubusercontent.com/u/63846399?s=400&u=66d28bb6d2d4ddc4c38d1d3a87da5890ca4ceb49&v=4',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageBuilder: (context, imageProvider) {
            // you can access to imageProvider
            return CircleAvatar(
              // or any widget that use imageProvider like (PhotoView)
              backgroundImage: imageProvider,
            );
          }),
    );
  }
}
