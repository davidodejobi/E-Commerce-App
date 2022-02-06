import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  const ScrollToHideWidget({
    Key? key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _ScrollToHideWidgetState createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool _isvisible = true;

  @override
  void initState() {
    widget.controller.addListener(listen);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      if (_isvisible) {
        setState(() {
          _isvisible = false;
        });
      }
    } else if (direction == ScrollDirection.forward) {
      if (!_isvisible) {
        setState(() {
          _isvisible = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      child: Wrap(
        children: [
          widget.child,
        ],
      ),
      height: _isvisible ? 56 : 0,
    );
  }
}
