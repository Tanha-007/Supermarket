import 'package:flutter/material.dart';

class TuitionListScreen extends StatelessWidget {
  const TuitionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tuitions = [
      {
        'id': '1',
        'title': 'Mathematics HSC',
        'price': '800',
        'tutor': 'Dr. Karim',
        'subject': 'Mathematics',
        'image': 'https://via.placeholder.com/200x150?text=Math',
      },
      {
        'id': '2',
        'title': 'English Literature',
        'price': '600',
        'tutor': 'Aisha Islam',
        'subject': 'English',
        'image': 'https://via.placeholder.com/200x150?text=English',
      },
      {
        'id': '3',
        'title': 'Physics Tuition',
        'price': '900',
        'tutor': 'Mr. Rahman',
        'subject': 'Physics',
        'image': 'https://via.placeholder.com/200x150?text=Physics',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tuition')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/tuition-search'),
        child: const Icon(Icons.search),
      ),
      body: ListView.builder(
        itemCount: tuitions.length,
        itemBuilder: (context, index) {
          final tuition = tuitions[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              '/tuition-details',
              arguments: tuition['id'],
            ),
            child: Card(
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(tuition['image'] as String),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tuition['title'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            tuition['tutor'] as String,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '৳${tuition['price']}/hour',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6366F1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
