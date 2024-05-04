class MyNotification {
  String? targettedUser;
  String? msg;
  String? id;
  MyNotification({this.targettedUser, this.msg, this.id});
  factory MyNotification.fromJson(Map<String, dynamic> json) {
    return MyNotification(
        targettedUser: json['TargettedUser'] ?? "",
        msg: json['msg'] ?? "",
        id: json['_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'TargettedUser': targettedUser,
      'msg': msg,
      '_id': id,
    };
  }
}

class DecodedNotification {
  String? idUser;
  MyNotification? notification;
  DecodedNotification({this.idUser, this.notification});

  factory DecodedNotification.fromJson(Map<String, dynamic> json) {
    return DecodedNotification(
      idUser: json['idUser'] ?? "",
      notification: MyNotification.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'data': notification,
    };
  }
}

class DecodedNotifications {
  String? idUser;
  List<MyNotification>? notifications = [];
  DecodedNotifications({this.idUser, this.notifications});

  factory DecodedNotifications.fromJson(Map<String, dynamic> json) {
    List<dynamic>? decodedList = json['data'];
    List<MyNotification>? decodedNotifications = decodedList != null
        ? decodedList.map((item) => MyNotification.fromJson(item)).toList()
        : [];
    return DecodedNotifications(
      idUser: json['idUser'] ?? "",
      notifications: decodedNotifications,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'data': notifications,
    };
  }
}
