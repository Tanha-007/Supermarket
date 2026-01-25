import 'package:flutter/material.dart';

class TuitionSearchScreen extends StatefulWidget {
  const TuitionSearchScreen({Key? key}) : super(key: key);

  @override
  State<TuitionSearchScreen> createState() => _TuitionSearchScreenState();
}

class _TuitionSearchScreenState extends State<TuitionSearchScreen> {
  late TextEditingController _searchController;
  String? _selectedSubject;
  String? _selectedLevel;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Tuition')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search by subject or tutor',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                prefixIcon: const Icon(Icons.location_city),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedSubject,
              decoration: InputDecoration(
                labelText: 'Subject',
                prefixIcon: const Icon(Icons.subject),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'mathematics', child: Text('Mathematics')),
                DropdownMenuItem(value: 'english', child: Text('English')),
                DropdownMenuItem(value: 'physics', child: Text('Physics')),
                DropdownMenuItem(value: 'chemistry', child: Text('Chemistry')),
              ],
              onChanged: (value) => setState(() => _selectedSubject = value),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedLevel,
              decoration: InputDecoration(
                labelText: 'Level',
                prefixIcon: const Icon(Icons.school),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'primary', child: Text('Primary')),
                DropdownMenuItem(value: 'secondary', child: Text('Secondary')),
                DropdownMenuItem(value: 'hsc', child: Text('HSC')),
                DropdownMenuItem(value: 'university', child: Text('University')),
              ],
              onChanged: (value) => setState(() => _selectedLevel = value),
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
