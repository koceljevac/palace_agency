import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width-24,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),child: Column(
      children: [
        Row()
      ],
    ),
    );
  }
}
