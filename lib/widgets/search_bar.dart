import 'package:flutter/material.dart';

import '/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Container(
        // child: FittedBox(
        //   fit: BoxFit.fill,
        //   child: SvgPicture.asset(
        //     'assets/icons/search.svg',
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search suits',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            )
          ],
        ),
        margin: const EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding / 4,
        ),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            kDefaultPadding / 2,
          ),
          boxShadow: [
            kDefaultShadow,
          ],
          color: Colors.white,
        ),
      ),
    );
  }
}
