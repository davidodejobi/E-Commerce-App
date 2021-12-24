import 'package:flutter/material.dart';

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
          buildActions(
            onPressed: () {},
            icon: Icon(
              Icons.line_style,
              color: Colors.pink[200],
              size: 30,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('David Program',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
              SizedBox(height: 5),
              Text(
                'Jakarta, INA',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          buildActions(
            onPressed: () {},
            icon: FittedBox(
              fit: BoxFit.fill,
              child: CircleAvatar(
                backgroundImage: Image.network(
                        'https://avatars.githubusercontent.com/u/63846399?s=400&u=66d28bb6d2d4ddc4c38d1d3a87da5890ca4ceb49&v=4')
                    .image,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell buildActions({VoidCallback? onPressed, Widget? icon}) {
    return InkWell(
      borderRadius: BorderRadius.circular(40),
      onTap: onPressed,
      child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 35,
                offset: const Offset(0, 5),
                spreadRadius: 0.5,
              )
            ],
            color: Colors.white,
          ),
          child: icon!),
    );
  }
}
