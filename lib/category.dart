import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorySection extends StatefulWidget {
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
    var onTapVar = widget.onTap;
    var dataVar = widget.data;
    var isActiveVar = widget.isActive;
    var activeColorVar = widget.activeColor;
    var bgColorVar = widget.bgColor;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => selectCategory(dataVar["name"]),
              child: Text(dataVar["name"]),
            ),
            SizedBox(width: 8),
            /* ElevatedButton(
              onPressed: () => selectCategory('Category 2'),
              child: Text('Category 2'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => selectCategory('Category 3'),
              child: Text('Category 3'),
            ),
            */
          ],
        ),
        /*  Flexible(
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
        */
      ],
    );
  }
}
