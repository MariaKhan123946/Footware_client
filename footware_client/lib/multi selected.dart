import 'package:flutter/material.dart';
List<String> selectedItems=[];
class MultiSelected extends StatefulWidget {
  final List<String>items;

  final Function(List<String>)onselectionChanged;
  const MultiSelected({Key? key, required this.items, required this.onselectionChanged}) : super(key: key);

  @override
  State<MultiSelected> createState() => _MultiSelectedState();
}

class _MultiSelectedState extends State<MultiSelected> {
  final List<String> items = ['Item1', 'Item2', 'Item3', 'Item4'];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(
            'Select Items',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Row(
                children: [
                  Icon(
                    selectedItems.contains(item)
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                  ),
                  SizedBox(width: 16),
                  Text(item),
                ],
              ),
              onTap: () {
                setState(() {
                  if (selectedItems.contains(item)) {
                    selectedItems.remove(item);
                  } else {
                    selectedItems.add(item);
                  }
                });
              },
            );
          }).toList(),
          onChanged: (String? value) {
            // Handle onChanged if needed
          },
          value: selectedItems.isEmpty ? null : selectedItems.last,
        ),
      ),
    );
  }
}
