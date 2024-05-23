import 'package:flutter/material.dart';
import 'package:takeoutapp/search.dart';

class CategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final Function(String) onTap;

  const CategoryChip({super.key, required this.label, this.isSelected = false, required this.onTap});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryChipState createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _handleTap() {
    widget.onTap(widget.label);
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: _isSelected ? Colors.red : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
  
}

class CategoryChipsRow extends StatefulWidget {
  const CategoryChipsRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CategoryChipsRowState createState() => _CategoryChipsRowState();
}

class _CategoryChipsRowState extends State<CategoryChipsRow> {
  String selectedCategory = 'Nearby';

  void _onCategoryTap(String category) {
    setState(() {
      selectedCategory = category;
      if(selectedCategory == 'Trivia'){
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Search()),
      );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CategoryChip(
          label: 'Nearby',
          isSelected: selectedCategory == 'Nearby',
          onTap: _onCategoryTap,
        ),
        CategoryChip(
          label: 'Trivia',
          isSelected: selectedCategory == 'Trivia',
          onTap: _onCategoryTap,
        ),
        CategoryChip(
          label: 'Express',
          isSelected: selectedCategory == 'Express',
          onTap: _onCategoryTap,
        ),
        CategoryChip(
          label: 'Asian',
          isSelected: selectedCategory == 'Asian',
          onTap: _onCategoryTap,
        ),
      ],
    );
  }
}

