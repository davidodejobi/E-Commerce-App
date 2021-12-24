import 'package:flutter/material.dart';

import '/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const CustomAppBar(),
        Row(
          children: const [
            SearchBar(),
            FilterOrSettings(),
          ],
        ),
      ],
    );
  }
}
