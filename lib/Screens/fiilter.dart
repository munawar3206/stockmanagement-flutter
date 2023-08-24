import 'package:flutter/material.dart';

enum FilterOption {
  Day,
  Week,
}

class FilterDropdown extends StatelessWidget {
  final FilterOption selectedFilter;
  final ValueChanged<FilterOption?> onChanged;

  FilterDropdown({
    required this.selectedFilter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<FilterOption>(
      value: selectedFilter,
      onChanged: onChanged,
      dropdownColor: Colors.black,
      items: FilterOption.values.map((option) {
        String optionText = option.toString().split('.').last;
        return DropdownMenuItem<FilterOption>(
          value: option,
          child: Row(
            children: [
              Icon(
                Icons.filter_alt_rounded,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              SizedBox(width: 8),
              Text(
                optionText,
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
