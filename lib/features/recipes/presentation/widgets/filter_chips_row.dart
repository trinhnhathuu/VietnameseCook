import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

class FilterChipsRow extends StatelessWidget {
  final List<String> filters;
  final String? selectedFilter;
  final ValueChanged<String>? onFilterSelected;

  const FilterChipsRow({
    super.key,
    required this.filters,
    this.selectedFilter,
    this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter == selectedFilter;
          
          return Padding(
            padding: const EdgeInsets.only(right: AppSizes.sm),
            child: FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (selected) {
                if (selected && onFilterSelected != null) {
                  onFilterSelected!(filter);
                }
              },
            ),
          );
        },
      ),
    );
  }
}