import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  final Color bgColor;
  final Color activeColor;
  final bool isActive;
  final GestureTapCallback? onTap;

  const CategorySection(
      {Key? key,
      required this.data,
      this.isActive = false,
      this.onTap,
      this.activeColor = Colors.blue,
      this.bgColor = Colors.white})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  String? selectedCategory;
  List<String> items = [];

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
      // Simulated data retrieval based on the selected category
// Replace this with your own logic to fetch the corresponding items
      items = _getItemsByCategory(category);
    });
  }

  List<String> _getItemsByCategory(String category) {
    // Simulated data for items based on category
    // Replace this with your actual data retrieval or logic
    switch (category) {
      case 'Category 1':
        return ['Item 1', 'Item 2', 'Item 3'];
      case 'Category 2':
        return ['Item A', 'Item B', 'Item C'];
      case 'Category 3':
        return ['Item X', 'Item Y', 'Item Z'];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    var dataVar = widget.data;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => selectCategory(dataVar["name"]),
              child: Text(dataVar["name"]),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
