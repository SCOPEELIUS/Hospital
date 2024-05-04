import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hospital/models/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class TCPClient extends ChangeNotifier {
  final String serverUrl = "http://45.79.53.206:3700";
  late io.Socket socket;
  late String id;
  bool isConnected = false;
  TCPClient();

  Future<void> connect({required String newId}) async {
    id = newId;
    try {
      socket = io.io(serverUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });
      socket.onConnect((_) {
        isConnected = true;
        notifyListeners();
        sendNotification(id);
      });
      socket.onDisconnect((_) {
        isConnected = false;
        notifyListeners();
      });
      socket.on('notification', (data) {
        DecodedNotification decodedNotification =
            DecodedNotification.fromJson(data);
        if (decodedNotification.idUser == id) {
          displayNotification(
              decodedNotification.notification ?? MyNotification());
        }
        sendNotificationRead(decodedNotification.notification?.id ?? "");
      });
      socket.on('notifications', (data) {
        DecodedNotifications decodedNotifications =
            DecodedNotifications.fromJson(data);
        if (decodedNotifications.idUser == id &&
            decodedNotifications.notifications != null &&
            decodedNotifications.notifications!.isNotEmpty) {
          int i = 0;
          decodedNotifications.notifications?.forEach((element) {
            displayTextNotification(element.msg ?? "", i);
            sendNotificationRead(element.id ?? "");
            i++;
          });
        } else {}
      });
    } catch (e) {
      ;
    }
  }

  void displayNotification(MyNotification notification) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        wakeUpScreen: true,
        id: 1,
        channelKey: "Hospital",
        title: "Emergency",
        body: notification.msg,
        displayOnBackground: true,
        displayOnForeground: true,
        color: Colors.white,
      ),
      actionButtons: [
        NotificationActionButton(
            key: "9", label: "Cancel", actionType: ActionType.DismissAction),
      ],
    );
  }

  void displayTextNotification(String notification, int id) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        wakeUpScreen: true,
        id: id,
        // customSound: "assets/notifications1.wav",
        channelKey: "Hospital",
        title: "Past notifications",
        body: notification,
        backgroundColor: Colors.blue,
        color: Colors.white,
      ),
      actionButtons: [
        NotificationActionButton(
            key: "$id", label: "Cancel", actionType: ActionType.DismissAction),
      ],
    );
  }

  void sendNotification(String userId) {
    if (isConnected) {
      socket.emit('serchNotification', userId);
    } else {}
  }

  void sendNotificationRead(String userId) {
    if (isConnected) {
      socket.emit('read', userId);
    } else {}
  }

  void disconnect() {
    if (isConnected) {
      socket.disconnect();
    }
  }
}
