import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWithBadge extends StatelessWidget {
  const IconWithBadge({
    required this.child,
    required this.value,
    this.color = Colors.redAccent,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final String? value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              // ignore: unnecessary_null_comparison
              color: color! != null
                  ? color
                  : Theme.of(context).colorScheme.secondary,
            ),
            constraints: const BoxConstraints(
              minWidth: 10,
              minHeight: 10,
            ),
            child: Text(
              value!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
