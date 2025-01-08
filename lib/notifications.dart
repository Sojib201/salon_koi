import 'package:flutter/material.dart';

import 'notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Sample notifications list
  List<NotificationModel> notifications = [
    NotificationModel(
      id: '1',
      title: 'Appointment Reminder',
      message: 'Your appointment is scheduled for tomorrow at 10:00 AM.',
      dateTime: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationModel(
      id: '2',
      title: 'Service Offer',
      message: 'Get 20% off on your next haircut. Offer valid till Friday.',
      dateTime: DateTime.now().subtract(Duration(days: 1)),
    ),
    NotificationModel(
      id: '3',
      title: 'Feedback Request',
      message: 'How was your experience with us? Leave a review!',
      dateTime: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  // Mark a notification as read
  void markAsRead(String id) {
    setState(() {
      notifications = notifications.map((notification) {
        if (notification.id == id) {
          return NotificationModel(
            id: notification.id,
            title: notification.title,
            message: notification.message,
            dateTime: notification.dateTime,
            isRead: true,
          );
        }
        return notification;
      }).toList();
    });
  }

  // Clear all notifications
  void clearNotifications() {
    setState(() {
      notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear_all),
            onPressed: clearNotifications,
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(
        child: Text(
          'No notifications',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: notification.isRead ? Colors.grey[200] : Colors.white,
            child: ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.message),
              trailing: Text(
                '${notification.dateTime.hour}:${notification.dateTime.minute}',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              onTap: () => markAsRead(notification.id),
            ),
          );
        },
      ),
    );
  }
}
