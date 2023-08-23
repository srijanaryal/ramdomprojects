import 'package:blocs/filter/model/product.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> categories = [
    'Accessories',
    'Gadgets',
    'Electronics',
    'Kitchenware'
  ];

  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    final filteredProducts = productList.where((product) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(product.category);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Product'),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: categories
                    .map((category) => FilterChip(
                        selected: selectedCategories.contains(category),
                        label: Text(category),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              selectedCategories.add(category);
                            } else {
                              selectedCategories.remove(category);
                            }
                          });
                        }))
                    .toList()),
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.category),
                    ),
                  );
                }))
      ]),
    );
  }
}
