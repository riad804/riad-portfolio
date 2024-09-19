import 'package:flutter/material.dart';

class DotBorder extends StatelessWidget {
  DotBorder({
    super.key,
    required this.child,
    this.bp,
  });

  final Widget child;
  double? bp;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: 40,
            right: 30,
            bottom: bp ?? 20,
          ),
          child: child,
        ),
        Positioned(
            top: 0,
            left: 7,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
            )),
        const Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.blue,
          ),
        ),
      ],
    );
  }
}
