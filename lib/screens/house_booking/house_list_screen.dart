import 'package:flutter/material.dart';

class HouseListScreen extends StatelessWidget {
  const HouseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final houses = [
      {
        'id': '1',
        'title': 'Beautiful 2-bedroom House',
        'price': '15000',
        'location': 'Gulshan',
        'image': 'https://via.placeholder.com/200x150?text=House+1',
      },
      {
        'id': '2',
        'title': 'Spacious 3-bedroom Villa',
        'price': '25000',
        'location': 'Banani',
        'image': 'https://via.placeholder.com/200x150?text=House+2',
      },
      {
        'id': '3',
        'title': 'Cozy 1-bedroom Apartment',
        'price': '8000',
        'location': 'Farmgate',
        'image': 'https://via.placeholder.com/200x150?text=House+3',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Houses')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/house-search'),
        child: const Icon(Icons.search),
      ),
      body: ListView.builder(
        itemCount: houses.length,
        itemBuilder: (context, index) {
          final house = houses[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              '/house-details',
              arguments: house['id'],
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
                        image: NetworkImage(house['image'] as String),
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
                            house['title'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            house['location'] as String,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '৳${house['price']}',
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
