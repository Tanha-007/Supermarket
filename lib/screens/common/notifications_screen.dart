import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'id': '1',
        'title': 'Booking Confirmed',
        'message': 'Your house booking has been confirmed',
        'time': '2 hours ago',
        'icon': Icons.check_circle,
      },
      {
        'id': '2',
        'title': 'New Message',
        'message': 'Ahmed Ali sent you a message',
        'time': '5 hours ago',
        'icon': Icons.mail,
      },
      {
        'id': '3',
        'title': 'Service Review',
        'message': 'Someone left a review on your service',
        'time': '1 day ago',
        'icon': Icons.star,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off,
                      size: 60, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Icon(
                      notification['icon'] as IconData,
                      color: const Color(0xFF6366F1),
                    ),
                    title: Text(notification['title'] as String),
                    subtitle: Text(notification['message'] as String),
                    trailing: Text(
                      notification['time'] as String,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
