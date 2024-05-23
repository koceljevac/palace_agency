import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {

  SearchBarSection({Key? key}): super(key: key);

  final TextEditingController _textEditingController =
      TextEditingController(text: 'Flutter Mapp');


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(controller: _textEditingController,)
      ],
    );
  }
}
