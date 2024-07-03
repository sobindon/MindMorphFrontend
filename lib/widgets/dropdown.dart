import 'package:flutter/material.dart';
import 'package:mindmorph/constants/constants.dart';

class MindMorphDropdown extends StatelessWidget {
  final String hint;
  final Map<String, String> items;
  final String? selectedItem;
  final Function(String?)? onChanged;

  const MindMorphDropdown({
    super.key,
    required this.hint,
    required this.items,
    this.selectedItem,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final _dynamicColor = items.isEmpty ? Colors.grey : featureColor;
    return DropdownButton<String>(
      hint: Text(
        '$hint  ',
        style: TextStyle(color: _dynamicColor, fontSize: 16),
      ),
      icon: Icon(Icons.arrow_downward, size: 16, color: _dynamicColor),
      value: selectedItem,
      onChanged: onChanged,
      items: items.entries.map<DropdownMenuItem<String>>((entry) {
        return DropdownMenuItem<String>(
          value: entry.key,
          child: Text(
            entry.value,
            style: const TextStyle(color: textFormFieldColor, fontSize: 16),
          ),
        );
      }).toList(),
    );
  }
}
