import 'package:flutter/material.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = [
      {
        'id': '1',
        'title': 'Professional House Cleaning',
        'price': '5000',
        'provider': 'Cleaning Experts',
        'category': 'cleaning',
        'image': 'https://via.placeholder.com/200x150?text=Cleaning',
      },
      {
        'id': '2',
        'title': 'Electrical & Plumbing Repair',
        'price': '500',
        'provider': 'Quick Repairs',
        'category': 'repair',
        'image': 'https://via.placeholder.com/200x150?text=Repair',
      },
      {
        'id': '3',
        'title': 'House Moving & Transportation',
        'price': '15000',
        'provider': 'Moving Experts',
        'category': 'moving',
        'image': 'https://via.placeholder.com/200x150?text=Moving',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/service-search'),
        child: const Icon(Icons.search),
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              '/service-details',
              arguments: service['id'],
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
                        image: NetworkImage(service['image'] as String),
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
                            service['title'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            service['provider'] as String,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '৳${service['price']}',
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
