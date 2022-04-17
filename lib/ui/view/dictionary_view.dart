import 'package:flutter/material.dart';

class DictionaryView extends StatefulWidget {
  DictionaryView({Key? key}) : super(key: key);

  @override
  State<DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<DictionaryView> {
  late final _numeric =
      dictionary.entries.map((e) => int.parse(e.key)).toList();
  late final _alpha = dictionary.entries.map((e) => e.value).toList();
  @override
  void initState() {
    super.initState();
    _alpha.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    _numeric.sort((a, b) => a.compareTo(b));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dictionary.entries.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(_numeric[index].toString()), Text(_alpha[index])],
          ),
        ),
      ),
    );
  }
}

const dictionary = {
  "34": "thirty-four",
  "90": "ninety",
  "91": "ninety-one",
  "61": "sixty-one",
  "9": "nine",
  "2": "two",
  "6": "six",
  "3": "three",
  "8": "eight",
  "80": "eighty",
  "81": "eighty-one",
  "99": "ninety-nine",
  "900": "nine-hundred",
};
