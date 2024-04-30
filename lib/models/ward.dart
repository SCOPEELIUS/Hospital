class Ward {
  String? wardName;
  String? noOfbeds;
  Ward({this.wardName, this.noOfbeds});

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
      wardName: json['wardNumber'] ?? "",
      noOfbeds: json['noBeds'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wardNumber': wardName,
      'noBeds': noOfbeds,
    };
  }
}

class Wards {
  List<Ward> wards = [];
  Wards({required this.wards});
  factory Wards.fromJsonList(List<dynamic> jsonList) {
    List<Ward> usersList = jsonList.map((json) => Ward.fromJson(json)).toList();
    return Wards(wards: usersList);
  }

  List<Map<String, dynamic>> toJsonList() {
    return wards!.map((ward) => ward.toJson()).toList();
  }
}
