import 'package:flutter/material.dart';

import 'over_label_container_card.dart';


class OverLabelContainerBody extends StatefulWidget {
  final List<String>items;
  const OverLabelContainerBody({
    super.key, required this.items,
  });

  @override
  State<OverLabelContainerBody> createState() => _OverLabelContainerBodyState();
}

class _OverLabelContainerBodyState extends State<OverLabelContainerBody> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          widget.items.length,
              (int index) {
            return OverLabelContainerCard(
              weekDay: widget.items[index],
              selected: currentIndex == index,
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
            );
          },
        )],
    );
  }
}
