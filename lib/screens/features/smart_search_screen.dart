import 'package:flutter/material.dart';

class SmartSearchScreen extends StatefulWidget {
  const SmartSearchScreen({Key? key}) : super(key: key);

  @override
  State<SmartSearchScreen> createState() => _SmartSearchScreenState();
}

class _SmartSearchScreenState extends State<SmartSearchScreen> {
  String? _selectedCategory;
  RangeValues _priceRange = const RangeValues(1000, 50000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Search')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find What You Need',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'houses', child: Text('Houses')),
                DropdownMenuItem(value: 'services', child: Text('Services')),
                DropdownMenuItem(value: 'tuition', child: Text('Tuition')),
              ],
              onChanged: (value) => setState(() => _selectedCategory = value),
            ),
            const SizedBox(height: 24),
            const Text(
              'Price Range',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 100000,
              divisions: 10,
              labels: RangeLabels(
                _priceRange.start.toInt().toString(),
                _priceRange.end.toInt().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() => _priceRange = values);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('৳${_priceRange.start.toInt()}'),
                  Text('৳${_priceRange.end.toInt()}'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                prefixIcon: const Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
